# LaTeX import / export map and facts

## Import (LaTeX -> TeXmacs), C++ in `src/Plugins/Tex/`
- Entry: `latex_to_tree_body` (`fromtex_post.cpp` ~2503): parse (`parsetex.cpp`) ->
  `parsed_latex_to_tree` (`fromtex.cpp`, `l2e`/`t2e`, `latex_concat_to_tree`) -> `finalize_document`
  -> `finalize_preamble` -> `handle_matches` -> `upgrade_tex` (`Data/Convert/Texmacs/upgradetm.cpp`,
  includes `upgrade_brackets`) -> `finalize_floats/misc/textm`.
- Inspect the raw parse tree from Scheme: `(plugin-initialize 'latex)` then
  `(tree->stree (parse-latex-document src))`; the final tree: `(latex->texmacs (parse-latex-document src))`.
- Command DRD (which LaTeX commands/envs take optional args etc.) lives in
  `TeXmacs/plugins/latex/progs/latex/convert-latex-command-drd.scm` (`latex-environment-0*%` = envs with
  an optional argument) and package deps in `convert-latex-drd.scm` (`(begin-aligned "amsmath")`).
- Tables: `parse_pmatrix` + `finalize_pmatrix` (`fromtex_post.cpp`). Rows split on `(FORMAT "next line")`
  (what `\\` becomes), columns on `(FORMAT "line separator")` (`&`).
  When the parser consumes an optional argument it renames the environment label to `name*`
  (`aligned*`, `gathered*`), so code must match both spellings (and `finalize_layout` maps it back).
- Braces `{...}` in the parse tree are `(tuple "\\begingroup") ... (tuple "\\endgroup")` siblings;
  `handle_matches` deletes the markers, so use them in `latex_concat_to_tree` (before `handle_matches`).
- `\|` converts to the TeXmacs symbol `"<||>"` (written `\<\|\|\>` in .tmu text; `\|` alone is a plain
  `|`). Adjacent plain symbols in a math concat are merged into one string by the conversion loop, so
  detect patterns on the INPUT tuples, not on the converted `r`.
- Bracket pairing: `upgrade_brackets` (`src/Data/Tree/tree_brackets.cpp`) works on a flat token list from
  `concat_tokenize` (which flattens nested concats), pairs the nearest same bars, and does not descend
  into compounds it does not know; call `upgrade_brackets (tree, "math")` yourself on a freshly built
  node's contents.
- `\left...\right`: handled in `l2e` (~`fromtex.cpp` 2506, `is_large_delimiter`); the label's backslash is
  stripped there, so `\|` used to become a single bar. Fixed in branch `latex-left-double-bar`
  (`\|` -> `"||"` first; `\Vert` already mapped to `"||"`).
- Nested norms: branch `latex-nested-norms` makes the importer read `bar {group} same-bar` as a nested
  `around` and the exporter brace such pairs (option `texmacs->latex:protect-nested-bars`, default on).
  Both are in `main`; details in `../notes/nested-norms-handoff.md` sections 2-4.

## Export (TeXmacs -> LaTeX), Scheme in `TeXmacs/plugins/latex/progs/latex/`
- `texmacs->latex` (`convert-latex-tmtex.scm`, near the end) pre-processes the document tree with
  `tmtm-eqnumber->nonumber` then **`tmtm-match-brackets`**, which downgrades every `around` into plain
  delimiter strings. `tmtex-around`/`convert-around` therefore do not see ordinary `around` nodes. Any
  rewrite of `around` structure must run BEFORE `tmtm-match-brackets`.
- Intermediate LaTeX tree uses `(!group x)` for `{x}`, `(!concat ...)`, `(!math ...)`. A TeXmacs tag
  needs a table entry such as `(tag (,fn 1))` (arity 1) with `fn` taking `(s l)`.
- Serialising: `(texmacs->latex-document tree opts)`; module-private helpers (`tmtex-initialize`) are not
  reachable from `-x` scripts, public ones are after `(use-modules (latex convert-latex-tmtex))`.
- Options: `(:option "texmacs->latex:NAME" "default")` inside a `converter` in `latex-format.scm` registers
  both the converter default and a preference (`converter-define-option` in `tm-convert.scm`). The user
  value is read in Scheme with `(assoc-ref opts "texmacs->latex:NAME")`; an absent key is `#f`. UI:
  accessor in `TeXmacs/progs/kernel/texmacs/pref-keys.scm`, checkbox list in
  `TeXmacs/progs/texmacs/menus/preferences-widgets.scm`. Pattern used: `texmacs->latex:protect-nested-bars`.
- `gather*`, `gather`, `align*`, `multline`... are exported by a fixed list in `tmtex-eqnarray`;
  other table macros (`aligned`, `gathered`) export through the generic table path as `\begin{name}`.
- `equation*` is exported as `\[ ... \]`, `equation` as `\begin{equation}`.

## Headless `-c` (src/System/Boot/init_texmacs.cpp, default branch)
- Upstream generated `(load-buffer in :strict) (export-buffer out)`; headless this wrote no file for
  `.tm -> .tex/.tmu`. Working form: `(lazy-plugin-force)`, source format `(url-format source)`, target
  format `(format-from-suffix (url-suffix target))` (formats like `latex` are only registered after the
  plugin initialises; `url-format` of a not-yet-existing file answers `generic`), `plugin-initialize`
  both, `(buffer-load source)`, `(buffer-export source target target-format)`. `lazy-plugin-force` takes
  about 1 s and turns `tex -> latex`, `bib -> bibtex`.

## aligned / gathered facts
- Upstream imports plain `\begin{aligned}` as generic `tabular*`; `aligned[t]` came out as
  `<aligned|t|<tformat...>>`; `gathered` as unsplit text. Fixed in branch `pr/amsmath-aligned-gathered` (formerly `amsmath-gathered`).
- `gathered` is defined in `TeXmacs/packages/environment/env-math.stem` (copy of `aligned*` with one
  centered column); put it inside `equation` for one number. Vertical position = `table-valign` in the
  block's own tformat: `f` axis (default when unset), `t`, `c`, `b`.
- `aligned` normally contains `(tformat (table (row (cell ..) ..)))`; `table-markup-context?` is true for
  such nodes, so the table focus-bar controls already apply.

## Matrices (branch with test `TeXmacs/tests/7002.scm`)
- Mogan native tags `matrix` (parenthesised = amsmath `pmatrix`), `bmatrix`, `Bmatrix`, `det`
  are defined in `TeXmacs/packages/standard/std-math.stem`.
- Import (`fromtex_post.cpp`, two places: the `v == tree (BEGIN, ...)` chain ~366 and the
  `u[i][0] == ...` chain ~578): `pmatrix`->`matrix`, `bmatrix`->`bmatrix` (was `tabular*` with literal
  `[` `]`), `vmatrix`->`det`, plain `matrix`->`tabular*`. `Bmatrix` is not mapped.
- Export: keys with an entry in `tmtex-table-props%` (convert-latex-tmtex.scm) become `\left..\right` +
  `array`; keys without one fall through `tmtex-table-apply` to `\begin{<tag>}`. `matrix` and `bmatrix`
  entries were REMOVED so they export as `pmatrix` (renamed in the fallback) and `bmatrix`. Package
  dependency: `(begin-pmatrix/bmatrix/Bmatrix "amsmath")` in `convert-latex-drd.scm`.

## Theorem / proof options (branches pr/latex-proof-title, pr/latex-theorem-option; tests 7003, 7004)
- Parser: an environment with an optional argument gets its label renamed `name*`; the option is only read when
  `latex_arity` of `\begin-name` is negative. `\newtheorem`/`\declaretheorem` (parsetex.cpp ~1150) used to
  reset it to 0, so `\begin{theorem}[Foo]` kept `[Foo]` as text; now -1.
- `finalize_layout`: `theorem*` -> `theorem` + `<dueto|..>`; `proof*` -> `render-proof|Title` (end marker is plain
  `proof`, so a stack of "titled" flags pairs them).
- `latex->texmacs` from Scheme does not give the same tree as the file converter for user-declared theorems
  (`claim[Bar]` -> `(claim "Bar" ...)`); not investigated.
- Running a test from a script: `-x "(load \"script.scm\")"` where the script loads the test, calls `(test_NNNN)`
  inside `catch`, and writes a marker with `string-save`; `check-report` text appears in the console log
  (`-d` ... `> log 2>&1`). Backslashes in files written through the shell tool lose one level: use the Write tool.
- A stray MoganSTEM.exe (e.g. a timed-out test) makes the next build fail with "busy"; kill it first.
