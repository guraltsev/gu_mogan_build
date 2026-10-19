**Branch:** `latex-left-double-bar` (1 commit, `c18646126`) -> `MoganLab/mogan:main`

**Title:** `[NNNN] Import \left\| as a double bar`

---

## What happened

A norm written with large delimiters, `\left\|f\right\|`, was imported with single bars
(`|f|`), so it looked like an absolute value. Nested, `\left\|\left\|f\right\|_{L^q}\right\|_{L^p}`
became `| | f |_{L^q} |_{L^p}`, which also exports to LaTeX that cannot be read back correctly.

## Cause

In the `\left`/`\right` branch of the importer (`l2e` in `src/Plugins/Tex/fromtex.cpp`) the
leading backslash is stripped from the delimiter name. For `\|` that leaves `|`. The names
`Vert` and `Arrowvert` are mapped to `||` afterwards, but `\|` never reached that step.

## Change

One line: map the label `\|` to `||` before the backslash is stripped.

## Verified (Windows, releasedbg, headless conversion)

`$\left\|\left\|f\right\|_{L^q}\right\|_{L^p}$` now imports as nested `<around*|\<\|\|\>|...`
with double bars. `\left\Vert` is unchanged. The existing conversion checks still pass.

## Not checked

Other delimiters in the same branch (`\left\langle` etc.) were not examined.

## How this fix was made

Developed through human-aided debugging: I reported the problem and ran and checked the
builds, and the cause was worked out interactively with an AI assistant. The code was
written using Claude Sonnet 5.5 (Anthropic); I reviewed and tested it before submitting.
The commit carries a `Co-Authored-By` trailer to the same effect.
