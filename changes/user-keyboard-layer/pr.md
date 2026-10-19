**Branch:** `user-keyboard-layer` (1 commit, `011d07d0f`) -> `MoganLab/mogan:main`

**Title:** `[NNNN] Add a user keyboard layer: user-kbd-map / user-kbd-unmap`

**Suggestion:** this changes the keyboard binding tables, so it may be best opened as a
draft or discussed before review.

---

## What happened

I keep my own keyboard shortcuts in `my-init-texmacs.scm`, for example extra bindings
for entering mathematics. They worked sometimes and silently did nothing at other times,
and a restart could change which. The reason was not a typo in my file: for some keys
Mogan's own built-in binding was registered *after* mine and quietly replaced it,
depending on when Mogan happened to load the corresponding keyboard module.

## Problem

Custom bindings in the user init file (`my-init-texmacs.scm`) are silently replaced by
built-in ones.

Key lookup returns the first matching entry of a per-key list, and each registration
puts its entry at the front, so the **last registration wins**. Until 2026-07-19
`init-research.scm` ended with `(lazy-keyboard-force #t)`, so every built-in keyboard
module was loaded *before* the user init file and user bindings were registered last.
`a9ea62bac` ([1143], "remove forced lazy-keyboard load at startup") removed that for
startup speed. Since then the built-in modules are loaded lazily, after the init file,
and a built-in registration for the same key and conditions replaces the user's
binding, depending on which module happens to be loaded when.

## Change

Bindings live in two layers in the same per-key list (`kbd-define.scm`):

- `kbd-map` and friends keep registering **built-in** entries.
- `user-kbd-map` registers **user** entries that always sort before built-in ones; a
  built-in registration never replaces or outranks a user entry with the same
  conditions, whenever it happens.
- `user-kbd-unmap` leaves a tombstone that hides built-in bindings with the same
  conditions, including ones registered later.
- User keys may be literal Unicode (for example `"α"`); they are normalised to the key
  name the application delivers (`alpha`).
- `shortcut-edit.scm`: saved shortcuts are now loaded with `user-kbd-map`.
- `kbd-define-test.scm` is extended for the new behaviour (+72 lines).

No existing API is removed; code that only uses `kbd-map`/`kbd-unmap` behaves as before.

## Reproduction on a clean build of `main` (`c68a494fc`)

With an empty user directory and the init file containing only
`(kbd-map ("alpha" "ZZZ"))`, a headless script presses the key `alpha` in text:

- right after startup the result is `ZZZ` (the user binding);
- after `(lazy-plugin-force)` and `(lazy-keyboard-force #t)` (what idle time in the GUI
  does) the same key press gives `<#3B1>`, the built-in binding from
  `(keyboard text-kbd-utf8)`.

With the init file containing `(user-kbd-map ("alpha" "ZZZ"))` on this branch the result is
`ZZZ` in both states.

## Verified

- `kbd-define-test.scm`: `regtest-kbd-define` reports **22 correct, 0 failed** on this
  branch (run today, built from this commit).
- In use: a personal init file with `user-kbd-map` bindings (math-mode `$`, a backtick
  prefix family, `A-x`) works in the GUI on Windows.

## Not checked

- Literal Unicode keys in the real GUI were not tested (only through the test suite and
  the key-name normalisation).
- Interaction with the shortcut-editor UI beyond the one-line change to the loader.
- macOS and Linux key delivery.
- The diff is large (about 250 lines in `kbd-define.scm`); I am glad to split or
  restructure it if you prefer a different design.

## How this fix was made

The fix was developed through human-aided debugging: I reported the symptoms, ran the
builds and checked the results by hand, and the cause was worked out interactively with
an AI assistant. The code itself was written using Claude Sonnet 5.5 (Anthropic). I
reviewed and tested it before submitting. The commit carries a `Co-Authored-By` trailer
to the same effect.
