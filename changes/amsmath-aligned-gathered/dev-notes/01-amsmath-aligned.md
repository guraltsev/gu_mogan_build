# 01 - amsmath `aligned` environments

Patch: `0001-Support-amsmath-aligned-environments.patch`
(original commit `3cdc990b6`; cherry-picked cleanly as `ef7aa505a`)

## What
LaTeX import (`.tex` -> TeXmacs) turns `\begin{aligned}[pos] ... \end{aligned}`
into TeXmacs' native `aligned` macro, honouring the optional vertical-position
argument and the `&` alignment markers, instead of a generic `tabular*`.

## Why
`aligned` used to be flattened into a `tabular*` table. That loses the native
macro's alternating right/left column layout and its zero outer cell padding, so a
leading or trailing `&` (common in `aligned` blocks) produced visible extra width,
and the optional `[t]`/`[b]` argument was misparsed as matrix parameters.

## How
`src/Plugins/Tex/fromtex_post.cpp`:
- `finalize_pmatrix`: `aligned` now calls `parse_pmatrix (..., "aligned")`.
- `parse_pmatrix`:
  - no optional argument: `tformat` gets `table-valign = c` (amsmath default,
    centered on the math axis);
  - optional argument `t`/`b`/`c`: stored as `table-valign` on the table, not on
    cells; any other value falls back to `c`;
  - for `fm == "aligned"`, a column that is empty in *every* row (created by a
    leading/trailing `&`) gets `cell-hmode=exact`, `cell-width=0spc`,
    `cell-lsep=0spc`, `cell-rsep=0spc`. A merely empty cell is not collapsed,
    since its column may hold the alignment anchor in another row. Helper:
    `empty_aligned_cell`.
- `finalize_layout`: the parser appends `*` to a command label when it consumed an
  optional argument; amsmath has no `aligned*`, so `aligned*` is normalised back
  to `aligned`.

`TeXmacs/plugins/latex/progs/latex/convert-latex-drd.scm`: declares
`(begin-aligned "amsmath")` (package dependency).

`TeXmacs/plugins/latex/progs/latex/convert-latex-command-drd.scm`: adds
`begin-aligned` to the `latex-environment-0*%` group (environments that may take
an optional argument).

## Verify
```
xmake run stem -headless -c t.tex t.tmu
```
with `t.tex` containing `\begin{aligned} a&=b\\ c&=d \end{aligned}`. Expect
`<\aligned> <tformat|<twith|table-valign|c>|<table|...>>` in `t.tmu`
(confirmed 2026-10-17).

## Caveats
- Only the tex -> TeXmacs direction was touched; export of `aligned` was not checked.
- No automated test was added.
- `fromtex.cpp(2560)` has an unrelated pre-existing C4129 warning.
