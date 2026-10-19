**Title:** `Moving the cursor and typing in math is choppy: the toolbars are rebuilt in Scheme after almost every cursor move`

**Labels (suggested):** bug, performance

---

## Summary

In a large document, moving the cursor through (nested) formulas, or typing in them, is
noticeably choppy, while ordinary text is fine. After a cursor move, the mode and focus
icon bars are rebuilt synchronously before the next key press is handled.

## Environment

- Mogan STEM built from `main` at `c68a494fc`, xmake mode `releasedbg`
- Windows 11 Enterprise, Qt 6.8.3

## Steps to reproduce

1. Open a large document with a lot of mathematics (the one I used: about 870 KB).
2. Put the cursor inside a nested formula (subscripts, fractions, an `aligned` block...).
3. Hold an arrow key, or type.
4. Optionally read the `std-bench` lines in `%APPDATA%\moganlab\system\<date>.log`.

## Expected

Cursor movement and typing are as responsive as in text.

## Actual

Each step stutters. From one editing session in the log: 511 `apply_changes` calls
averaged 71 ms; about 70 ms of that was `update_menus`, of which
`update_menus: icons2-focus` averaged 50 ms (383 calls) and `icons1-mode` 21 ms
(397 calls).

## Cause

`edit_interface_rep::apply_changes ()` calls `update_menus (ICONS_MODE | ICONS_FOCUS)`
whenever the focus path changed, and moving through nested math changes it almost every
step. Rebuilding the two bars is a Scheme evaluation (`menu-expand`); timed at the live
cursor it takes 22-44 ms for the focus bar in math (7-25 ms in text) and 14-23 ms for the
mode bar. In stack samples taken while moving the cursor, 19 of 29 busy samples were in
`update_menus > menu_icons > get_menu_widget`, 14 of them in s7 variable lookup. All of it
happens before the next key is processed.

## Possible fix

Do not rebuild the bars on every plain cursor move: postpone the refresh until the cursor
has been still for a short time (I used 150 ms, at most 600 ms during continuous movement),
and keep refreshing immediately when the tree was modified. Pull request: branch
`delay-toolbar-refresh`. The trade-off is that the icons can lag the cursor by that delay.

## Notes

The diagnosis was worked out interactively with an AI assistant (Claude Sonnet 5.5); I
reproduced the choppiness and checked the log numbers by hand.
