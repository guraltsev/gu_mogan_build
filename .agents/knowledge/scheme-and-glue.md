# Scheme / C++ / preferences

- Glue declarations live in `src/Scheme/Glue/glue_*.lua`, NOT in the legacy `.scm` files.
- A converter `:option "name" "default"` in a format file (e.g. `latex-format.scm`)
  auto-registers a preference with that default (`converter-define-option`,
  `tm-convert.scm`). Reading it in a converter: `(assoc-ref opts "name")`; an absent
  option counts as the default only if your code says so.
- Preference keys: `TeXmacs/progs/kernel/texmacs/pref-keys.scm`; settings UI checkbox:
  `TeXmacs/progs/texmacs/menus/preferences-widgets.scm`. Chinese strings are separate
  (not added so far).
- `tree-set!` needs a variable as first argument, not an expression.
- Module-private functions (e.g. `tmtex-initialize`) are not callable from `-x`; use
  `(plugin-initialize 'latex)` then `(use-modules (latex convert-latex-tmtex))` for public ones.
- Scheme list literals in evaluated position are applied: quote them (`'("a" "b")`).
- `kbd-enter`-style `tm-define` clauses with `:require`: the LATER-loaded clause wins, so
  behaviour can depend on module load order.
- Style/package cache is shared per version in `%LOCALAPPDATA%\moganlab\system\cache\<ver>\`;
  package changes do not invalidate it without the cache-stamp fix (in `main`). Compare
  builds with isolated `LOCALAPPDATA` and `TEXMACS_HOME_PATH`.
- Probe without patching the installed tree: write a read-only `.scm`, run
  `MoganSTEM.exe -headless -x "(load \"<script>\")"`, save output with `string-save` to a
  path from an env var.
