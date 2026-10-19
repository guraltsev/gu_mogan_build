# 07 - LaTeX import of `gathered`; optional argument of `aligned`/`gathered`

Patch: `0007-Import-LaTeX-gathered-honour-optional-argument-of-al.patch`
(branch commit `a46880fcd`; requires patch 6 for the `gathered` macro)

## What
- `\begin{gathered} ... \end{gathered}` is imported as the native `gathered`
  macro with a real table: one row per `\\`, `table-valign` taken from the
  optional `[t|b|c]` argument (default `c`).
- Fixes the optional argument of **`aligned`** too, which patch 1 never got
  working: `\begin{aligned}[t]` used to give `<aligned|t|<tformat|...>>`
  (a stray macro argument, no valign).

Export needs nothing new: patch 6 already declares the `amsmath` dependency and
the generic table exporter writes `\begin{gathered}`.

Files: `src/Plugins/Tex/fromtex_post.cpp`,
`TeXmacs/plugins/latex/progs/latex/convert-latex-command-drd.scm`
(`begin-gathered` added to `latex-environment-0*%`, next to `begin-aligned`).

## Why the optional argument failed
When the parser consumes an optional argument it renames the environment label
to `aligned*` (see the comment in `finalize_layout`). `finalize_pmatrix` only
matched `aligned`, so those blocks never reached `parse_pmatrix`; a later generic
path built the table and left `t` behind as an extra macro argument. Now both
`aligned`/`aligned*` and `gathered`/`gathered*` go to `parse_pmatrix`, which
already knew how to read the argument.

## Verified (build/dist-releasedbg, `MoganSTEM -headless -c in.tex out.tmu`)
| Input | Result |
|---|---|
| `\[\begin{gathered} a=b\\ c=d \end{gathered}\]` | `<gathered|<tformat|<twith|table-valign|c>|<table|<row|a=b>|<row|c=d>>>>` |
| same inside `$$..$$`, `equation`, `$..$` | same |
| `\begin{gathered}[t]`, `[b]` (alone, in `equation`, mid-line between text) | `table-valign` `t` / `b` |
| `\begin{aligned}[t]` / `[b]` | `<\aligned>` with `table-valign` `t` / `b` (was `<aligned|t|...>`) |
| `aligned` without argument, `a&=b\\ c&=d` | unchanged |
The old `dist-release` build (no patches 6/7) left `gathered` as
`a=b<next-line>c=d` and `aligned[t]` broken, for comparison.

## Caveats
- Test input must really contain `\\`. Files written with shell heredocs/`printf`
  lost one backslash in this environment (see `../../../issues/`); use the Write
  tool and check with `od -c`.
- Only the import direction was changed; no round-trip file comparison was run
  (export of `gathered` was checked in patch 6, import here).
- No automated test added. `gf fmt --changed-since=main` was not run.
- Other optional-argument environments with the same `*` renaming were not
  audited (e.g. `alignedat`, `array[t]`).
