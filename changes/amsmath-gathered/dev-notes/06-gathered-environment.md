# 06 - amsmath-style `gathered` environment

Patch: `0006-Add-amsmath-style-gathered-environment.patch`
(branch commit `67c5bc187`)

## What
A new `gathered` macro: several rows, **one centered column**, meant to sit inside
`equation` so the whole block gets a **single equation number**.

Files: `TeXmacs/packages/environment/env-math.stem` (the macro, a copy of
`aligned*` with one centered column) and
`TeXmacs/plugins/latex/progs/latex/convert-latex-drd.scm`
(`begin-gathered` needs `amsmath`).

## Why
Multiline equations in Mogan, and which to use:

| Environment | Layout | Numbers |
|---|---|---|
| `equation` / `equation*` | one formula | one / none |
| `align` / `align*` | rows split at `&` | per row / none |
| `gather` / `gather*` | rows centered, one column | per row / none |
| `eqnarray` / `eqnarray*` | three columns | per row / none |
| `multline` | one long formula broken over lines | one |
| `aligned*` (inside `equation`) | `&`-aligned rows | one for the block |
| **`gathered`** (inside `equation`, new) | centered rows, one column | one for the block |

Before this patch there was no way to get centered rows under one number
(`gather` numbers every row; `aligned*` right-aligns a row without `&`).

## Structure
```
(equation (document (gathered (tformat (table (row (cell "a=b"))
                                              (row (cell "c")))))))
```
Without a number: use `gather*`.

## Editing: Alt+Down / Alt+Up (user init, not part of the patch)
`../../../user-config/my-init-texmacs.scm` binds, in math mode, `A-down` / `A-up`
to `user-multiline-equation`:
- in `equation*` or `equation` -> the display environment stays (numbered or not)
  and its content is wrapped in a `gathered` with a new row below / above;
- already inside `gathered`, `gather(*)`, `align(*)`, `aligned(*)`, `eqnarray(*)`,
  `multline(*)`, `eqsplit(*)`, ... -> inserts a row (`table-insert-row`).
The cursor lands in the new row. Existing paragraphs of the old body each become
a row.

## LaTeX export
Checked through `texmacs->latex-document`:
```latex
\usepackage{amsmath}
\begin{equation}
  \begin{gathered}
    a = b\\
    c
  \end{gathered}
\end{equation}
```
Needs no export code beyond the `amsmath` declaration: tables are exported
generically, as for `aligned`.

## Verified
Headless, simulated key presses: all of `equation*`/`equation` x `A-down`/`A-up`,
plus a second key press inside the new environment, give the expected trees
(one number kept). LaTeX export as above.

## Not verified / caveats
- Visual layout (centering, spacing) was not looked at; spacing is copied from
  `aligned*`. Needs a look in the GUI.
- Whether Windows/Qt delivers Alt+Down / Alt+Up to Mogan was not tested.
- LaTeX **import** of `\begin{gathered}` is not part of this patch; see patch 7.
- Documents written with `gathered` need a Mogan with this patch to render it.
- If an old style cache hides the new macro: start once with
  `MoganSTEM.exe -delete-style-cache`.
- `gf fmt --changed-since=main` was not run (`gf` not installed here).
