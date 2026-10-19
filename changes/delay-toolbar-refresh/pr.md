**Branch:** `delay-toolbar-refresh` (1 commit, `5e21639cd`) -> `MoganLab/mogan:main`

**Title:** `[NNNN] Delay the mode/focus toolbar refresh while the cursor moves`

---

## What happened

While editing a long mathematical paper (about 870 KB of TeXmacs source) in Mogan STEM,
moving the cursor through a formula, or typing in one, felt choppy, while ordinary text
was fine. The delay was small per key press but noticeable. Profiling showed it came from
the toolbars above the page being rebuilt, in Scheme, after almost every cursor movement
inside nested formulas, before the next key press could be handled.

## Problem

Moving the cursor and typing in math is noticeably choppy in a large document. Every
time the focus path changes, `apply_changes` rebuilds the mode and focus icon bars
synchronously (`update_menus (ICONS_MODE | ICONS_FOCUS)`), before the next key is
handled. Moving through nested math changes the focus path almost every step.

## Measurements (before)

- Log of one editing session: 511 `apply_changes` calls averaging 71 ms, of which
  about 70 ms was `update_menus`: `icons2-focus` 50 ms on average (383 calls),
  `icons1-mode` 21 ms (397 calls).
- The cost is the Scheme evaluation of the two toolbars (`menu-expand`); in stack
  samples while moving the cursor, 19 of 29 busy samples were in
  `update_menus > menu_icons > get_menu_widget`, 14 of them in s7 variable lookup.
  Timed per expansion at the live cursor:
  focus icons 22-44 ms in math (7-25 ms in text), mode icons 14-23 ms.

## Change (`edit_interface.cpp/.hpp`)

1. **Plain cursor movement** no longer rebuilds the bars on the spot. A due time is
   recorded and `animate ()` performs the refresh after the cursor has been still for
   150 ms, or at most 600 ms after the first pending move so that holding an arrow
   key still refreshes. (`MENU_ICONS_DELAY`, `MENU_ICONS_MAX_DELAY`.)
2. **Tree modifications still refresh immediately**, as before. The refresh branch in
   `apply_changes` is now entered on `THE_CURSOR | THE_TREE`.
3. **The "did the focus change?" test also compares the label of the focus node**
   (new member `menu_focus_tag`), not only its path. A replacement at the same path,
   e.g. Ctrl+Tab turning `equation` into `equation*`, leaves the path unchanged and was
   not detected. I did not check whether the unmodified code showed this for Ctrl+Tab;
   it surfaced for `$ $` and Ctrl+Tab while developing the deferral.
4. Any full mode+focus rebuild (`update_menus`, mouse click path) clears a pending
   deferred refresh.

## Verified

- Built and run on Windows 11, Qt 6.8.3. By hand: moving through nested math and typing
  is smooth in the large document; the toolbar follows after `$ $` and Ctrl+Tab.
- No number was recorded for the after-state (the log of that session is dominated by
  document load time).

## Trade-offs and not checked

- The icons can lag the cursor by up to 150 ms (600 ms while a key is held).
- Handwriting/graphics mode: the existing guard is kept, but that path was not tested.
- Several windows on one buffer, macOS and Linux were not tested.
- No automated test (it needs a GUI event loop).

## How this fix was made

The fix was developed through human-aided debugging: I reported the symptoms, ran the
builds and checked the results by hand, and the cause was worked out interactively with
an AI assistant. The code itself was written using Claude Sonnet 5.5 (Anthropic). I
reviewed and tested it before submitting. The commit carries a `Co-Authored-By` trailer
to the same effect.
