# 05 - Debounce mode/focus toolbar refresh on cursor movement

(branch commit `18694c015`; independent of patch 4, different files)

## What
When a cursor move changes the focus path, `apply_changes` no longer rebuilds the
mode and focus icon bars on the spot. It records a due time
(`menu_icons_due`); `edit_interface_rep::animate ()` performs
`update_menus (ICONS_MODE | ICONS_FOCUS)` once the cursor has been still for
150 ms. Continuous movement is capped: the refresh happens at most 600 ms after
the first pending move (`menu_icons_since`).

Explicit `update_menus` calls (`THE_MENUS` changes, mouse clicks in
`edit_mouse.cpp`) still rebuild at once; any full mode+focus rebuild clears the
pending deadline.

Files: `src/Edit/Interface/edit_interface.cpp`, `edit_interface.hpp`.
Constants `MENU_ICONS_DELAY` / `MENU_ICONS_MAX_DELAY` at the top of the .cpp.

## Why
Editing and moving in math was choppy on a large document. Per-keystroke cost
was ~70 ms of `update_menus`, nearly all of it Scheme evaluation of the two
toolbars (`menu-expand`), done synchronously before the next key was handled.
Moving through nested math changes the focus path almost every step, so the
"only rebuild if the focus path changed" guard rarely helped.

## How it was found
- `std-bench` log: `update_menus: icons2-focus` ~50 ms and `icons1-mode`
  ~21 ms per edit.
- `cdb` stack sampling (see patch 4 README): 19 of 29 busy samples in
  `update_menus > menu_icons > get_menu_widget` (Scheme, mostly s7 symbol lookup).
- `probe-focus-icons.scm` (in this folder) timed `menu-expand` per sub-menu at the live
  cursor (launch with `-x "(load \"<path>\")"`; PowerShell needs the argument
  string built by hand, see below). Typical results, `ubht-orig.tm`:

  | Cursor in | focus icons | mode icons |
  |---|---|---|
  | text (`document`, `em`) | 7-25 ms | 14-20 ms |
  | math (`ltae`, `around*`, `rsub`) | 22-44 ms | 16-23 ms |

  Biggest parts in math: `focus-insert-icons` (up to 17 ms), `focus-tag-icons`
  (9-18 ms), and a flat ~15 ms for `text-icons` / `math-icons`.

PowerShell launch with the probe (build the argument string by hand, otherwise
the quotes in `-x` are lost and only `(load` is passed):
```powershell
$a = '"<file.tm>" -x "(load \"C:/.../05-debounce-toolbar-refresh/probe-focus-icons.scm\")"'
Start-Process MoganSTEM.exe -ArgumentList $a
```
Report goes to `%TEMP%\probe-focus-icons.txt`.

## Result
Confirmed by hand on `ubht-orig.tm` in the releasedbg build: moving through math
and typing are smooth. No before/after numbers were recorded for this patch
(the log of that session is dominated by load time).

## Caveats / trade-offs
- The toolbar icons lag the cursor by ~150 ms (up to 600 ms while a key is held).
- `gf fmt --changed-since=main` was not run (`gf` not installed here).
- Does not make the toolbar expansion itself cheaper. Remaining ideas: cache
  `menu-expand` by focus tree label, avoid rebuilding `text-icons`/`math-icons`
  (flat 15 ms each), look at `focus-insert-icons` / `focus-tag-icons`.
- Not tested: handwriting/graphics mode (guard unchanged, deferred path skipped
  when `graphics-handwriting?`), multiple windows on one buffer.
