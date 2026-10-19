# Scheme / editor internals that cost time to find

## tm-define, tm-menu, overrides
- `tm-define` / `tm-menu` / `menu-bind` clauses guarded by `(:require pred)`: **the most recently
  defined matching clause wins**, so behaviour depends on module load order when two modules define
  clauses for the same tag. Chain to the previous definition with `(former args...)`
  (`tm-define`/`tm-menu`) or `(former)` (`menu-bind`).
- Enter: `kbd-return` -> `(kbd-enter (focus-tree) #f)`. Generic table row insertion is the clause for
  `table-markup-context?` in `progs/table/table-edit.scm`; `progs/math/math-edit.scm` has older clauses
  for `math`, `equation`, `equation*`, `aligned` (the `aligned` one assumes a plain formula and nests a
  table into a cell if the block already holds a table; fixed by requiring `(not (table-markup-context? t))`).
- `tree-set!` must get a variable as its first argument, not an expression like `(tree-ref t 0)`.
  `tree-innermost` takes a tag symbol, a list of tags, or a predicate; `tree-go-to t i j ... :start|:end`.
- `table-insert-row downwards?`, `table-set-valign`, `table-set-format*` act on the table at the cursor.

## Focus bar and menus
- Focus bar items come from `focus-extra-icons` clauses (and `focus-extra-menu` for the Focus menu), e.g.
  in `progs/table/table-menu.scm`; add a clause with a narrower `:require` that starts with `(former t)`.
- C++ side: `edit_interface_rep::apply_changes` (`src/Edit/Interface/edit_interface.cpp`) decides when
  `update_menus (ICONS_MODE | ICONS_FOCUS)` runs: when the focus path/tag changed. `animate ()` runs every
  GUI tick (about 15 ms) and can do deferred work. `menu_icons` -> `get_menu_widget` calls Scheme
  `menu-expand`; that expansion is the expensive part (tens of ms in math).
- Each `repaint` calls `draw_remote_cursors`; `get_remote_cursors` used to convert the whole buffer
  (O(document)); it now returns early when there are no remote cursors.

## Keyboard
- Per-key list; **last registration wins** (`kbd-map`, `utf8-kbd-map`, `delayed-kbd-map`). Built-in
  keyboard modules load lazily and, since `a9ea62bac` ([1143]), after the user init file, so they override
  user bindings. `user-kbd-map` / `user-kbd-unmap` (branch `user-keyboard-layer`) keep user entries ahead.
- Literal Unicode keys: C++ `handle_keypress` strips `<>` from single named symbols, so Scheme sees
  `alpha`, not `<alpha>`.
- Pre-edit: the first key of a multi-key sequence such as `$ $` is inserted tentatively and undone when the
  sequence completes, so the action sees the ORIGINAL state (text, not the empty math). Prefix
  sequences cannot be told apart by mode of the second key; test the real state in the action.

## Style cache
- Compiled styles are cached as `%LOCALAPPDATA%\moganlab\system\cache\<version>\<md5>.scm`; the file name
  was derived from style NAMES only and `style_set_cache` never overwrites, so changed packages were
  ignored. Branch `style-cache-invalidation` adds a stamp (newest mtime + file count of `*.ts/*.stem`).
  `-delete-style-cache` deletes `__*` and therefore removes nothing.
- A stale entry shows a newly added macro as an unknown tag `<name|...>`; cache files containing the
  word are easy to spot with `grep -c`.

## Misc
- Format names/suffixes: `(format-from-suffix "tex")` is `generic` before the latex plugin is initialised.
- `(texmacs-time)` is milliseconds; `(delayed (:pause N) ...)` runs in the main loop (works headless).
- `-x` Scheme runs before the GUI loop; delayed commands run in `-headless` too.
