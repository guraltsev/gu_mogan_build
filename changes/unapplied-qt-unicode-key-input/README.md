# UNAPPLIED - Preserve non-ASCII text in Qt key events

**Status: removed from the branch on purpose.** It does not affect the Greek
keyboard layout it was written for, and no other case that needs it has been
reproduced. Kept only as a record; apply with `git am` if a layout is found that
reports a non-ASCII character under a printable Qt key code.

**Why it is not needed here:** on the target machine (Windows, Greek layout), Qt
reports the alpha key as code 177 with no modifiers. That is outside the printable
range (33..126) the patch changes, so the unchanged code already takes the branch
that passes the UTF-8 text through correctly. The real cause of the broken custom
bindings was binding precedence; see `../user-keyboard-layer/dev-notes/03-user-kbd-map.md`.

Patch: `0003-Preserve-non-ASCII-text-in-Qt-key-press-events.patch`
(commit `466c9c91d`)

## What
In `from_key_press_event` (`src/Plugins/Qt/qt_utilities.cpp`), when the event has no
modifier (or only Shift) and its text starts with a code point above 255, the full
UTF-8 text is passed on instead of the first UTF-16 unit cast to `char`.

## Why
Symptom: `utf8-kbd-map` bindings with non-ASCII keys (e.g. `("α" ...)`) never fire.
The printable-key branch (`is_printable_key`: Qt key code 33..126, i.e. Latin keys
even on a Greek layout) did `char text_key = (char) nss.data()[0].unicode()`, which
destroys the code point (α = U+03B1 becomes 0xB1) before `handle_keypress` can do
its UTF-8 -> Cork conversion. Full analysis:
`../../notes/mogan-unicode-greek-keyboard-bug-report.md`.

## How
```cpp
if ((is_empty (mods_text) || mods_text == "S-") && !nss.isEmpty () && unic > 255)
  r= from_qstring_utf8 (nss);
else if (is_empty (mods_text) || mods_text == "S-")
  r << text_key;            // unchanged ASCII behaviour
```
The `> 255` threshold keeps existing ASCII/Latin-1 shortcut behaviour intact.

## Original test plan (never run to a conclusion)
Built successfully (2026-10-17). To test:
1. `xmake run stem`.
2. Add to `%APPDATA%\moganlab\progs\my-init-texmacs.scm`:
   ```scheme
   (utf8-kbd-map (:mode in-math?) ("α" "<alpha>"))
   ```
   The repo copy `../../user-config/moganlab/progs/my-init-texmacs.scm` still has `"alpha" "fuck"`
   debug bindings; remove them first. Math bindings must be registered after
   `(module-provide '(math math-kbd)) (kbd-flush-pending)`.
3. Type α on a Greek layout / IME in math mode; expect the alpha symbol.

## Known limitations
- Latin-1 non-ASCII characters (U+0080-U+00FF, e.g. é, ß) are still truncated to
  `char` by this branch because of the `> 255` threshold. Lowering it to `> 127`
  would cover them but changes behaviour for existing Latin-1 input, so it was not
  done without testing.
- Only the no-modifier / Shift case is handled; Alt/AltGr combinations keep the
  old paths.
- The separate `ab78f9c83` regression report (ASCII `alpha` alias not converting
  after `utf8-kbd-map` was introduced) was not investigated or fixed here.
- Not formatted with `gf fmt` (not installed). The code comment is Chinese per
  project rules.
