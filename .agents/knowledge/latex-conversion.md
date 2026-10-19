# LaTeX conversion

## Import (tex -> tmu), C++
- Entry: `latex_to_tree_body` in `src/Plugins/Tex/fromtex_post.cpp` (~2500):
  `parsed_latex_to_tree` -> ... -> `handle_matches` -> `upgrade_tex`.
- Bracket pairing = `upgrade_brackets` (`src/Data/Tree/tree_brackets.cpp`), called from
  `upgrade_tex` (`src/Data/Convert/Texmacs/upgradetm.cpp` ~4627). It pairs the NEAREST
  same bar, so `\|\|f\|\|` is always read as two empty pairs. That is inherent.
- The parser keeps `{...}` as `(tuple "\begingroup") ... (tuple "\endgroup")`, but
  `handle_matches` (`reopen_envs`, `handle_improper_matches`) drops the markers and
  `concat_tokenize` flattens nested concats. So grouping information is gone after t6;
  to use it, act earlier, in `latex_concat_to_tree` (`src/Plugins/Tex/fromtex.cpp`).
- Adjacent plain math symbols are merged into one string by the conversion loop.
- A node you build inside `latex_concat_to_tree` is not visited by the later global
  `upgrade_brackets` pass: call `upgrade_brackets (body, "math")` on its content yourself.
- `\left...\right` is converted in `l2e` (`fromtex.cpp`, branch `is_large_delimiter`).
- Symbols: `\|` -> `"<||>"` (shown `\<\|\|\>` in .tmu), `|` stays `"|"`.

## Export (tm -> tex), Scheme
- `texmacs->latex` in `TeXmacs/plugins/latex/progs/latex/convert-latex-tmtex.scm`
  (~4900) first runs `tmtm-eqnumber->nonumber`, then `tmtm-match-brackets`
  (`TeXmacs/progs/convert/rewrite/tmtm-brackets.scm`), which DOWNGRADES every small
  `around` to flat delimiter characters. `convert-around`/`tmtex-around` are therefore not
  reached for ordinary documents: changing them has no effect. Do the work in a pre-pass on
  the stree before that step (see `tmtex-protect-nested-bars`).
- Large `around*` becomes `\left..\right` and is unambiguous; leave it.
- Brace group in the exporter's intermediate language: `(!group ...)`.
- Nested norms are exported as `\| {\|f\|_{L^q}} \|_{L^p}` (option
  `texmacs->latex:protect-nested-bars`, default on). The importer only understands
  `bar {group} same-bar`; other delimiters and the unbraced form are unchanged.

## amsmath blocks
- `aligned`/`gathered` support is in the earlier PRs (see
  `changes/pr-6-*` .. `pr-8-*`); `\` rows are lost if a fixture is written through a shell.
