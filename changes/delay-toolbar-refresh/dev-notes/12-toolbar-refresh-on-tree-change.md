# 12 - Toolbar refresh on tree changes (fix for patch 5)

Patch: `0012-Refresh-focus-toolbars-immediately-on-tree-changes-d.patch`
(file: `src/Edit/Interface/edit_interface.cpp`, `.hpp`; supersedes part of patch 5)

## Symptom (reported)
- First `$` makes inline math, second `$` makes display math, but the toolbar still
  says "inline math".
- Ctrl+Tab changes the kind of the formula (`equation` <-> `equation*`) but the
  toolbar does not change.

## Causes
1. Patch 5 postponed *every* refresh of the mode/focus bars to `animate ()`, also
   when the tree had been modified. The original code refreshed in the same
   `apply_changes` step in which the tree changed.
2. The "did the focus change?" test (`fp != menu_focus_path`, already in the
   original) compares paths only. Replacing a node at the same path, as Ctrl+Tab
   does, was never detected. The branch was also entered only on `THE_CURSOR`, not on
   `THE_TREE`.

(The log of the user session showed `update_menus` did run about 100 ms after the
two `$` presses, so the refresh was happening, only not at the right moment / not
with the right content for structural changes.)

## Fix
- `apply_changes`: the menu branch now handles `THE_CURSOR | THE_TREE`.
- New member `menu_focus_tag` = label of the focus node at the last refresh; a
  different label counts as a change, like a different path.
- If the tree changed: `update_menus (ICONS_MODE | ICONS_FOCUS)` immediately.
  Only plain cursor movement is delayed (150 ms, at most 600 ms), as in patch 5.

## Verified
- Builds; previous regression scripts (Alt+Up/Down, `$` handling) and the 31
  headless conversion tests still pass.
- NOT verified: the toolbar behaviour itself. It needs the real GUI (the update
  runs from `apply_changes`/`animate`, not in headless mode). Please try `$ $` and
  Ctrl+Tab with `build\dist-releasedbg\bin\MoganSTEM.exe`, **not** the installed copy
  under `C:\opt\mogan\current`.

## Caveats
- Tree changes while typing in a formula refresh the bars only when the focus node
  path or label actually changes, so typing cost is unchanged.
- `gf fmt` was run; the `operator tree ()` hunk that clang-format 22 produces was
  reverted (see patch 8).
