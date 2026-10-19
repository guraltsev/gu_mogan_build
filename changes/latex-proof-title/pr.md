**Branch:** `pr/latex-proof-title` (1 commit) -> `MoganLab/mogan:main`

**Title:** `[NNNN] LaTeX: import \begin{proof}[Title] as a titled proof`

---

## What happened

Importing a LaTeX proof with an optional title, such as `\begin{proof}[Proof of Theorem 1] ... \end{proof}`,
silently destroyed the environment: the title and the `proof` block were gone and the body text was left
as a plain paragraph. A proof without a title (`\begin{proof} ... \end{proof}`) was fine.

## Cause

The parser consumes the optional argument and renames the environment `proof*`. In `finalize_layout`
(`src/Plugins/Tex/fromtex_post.cpp`) the theorem-like branch skips `proof*` on purpose and no other branch
emits a begin marker for it; the closing `\end{proof}` has no memory of the option, so it no longer pairs
with anything. Neither marker survived.

## Change

- A titled proof is emitted as `<\render-proof|Title> ... </render-proof>`. This is the macro the standard
  `proof` and `proof-of` are built on, and the one the exporter already uses for this shape, so the title
  replaces the word "Proof" instead of being appended to it.
- Because the end marker has no option, `finalize_layout` keeps a small stack recording whether each open
  proof was titled, and closes it with `render-proof` or `proof` accordingly. Untitled and nested proofs
  behave as before.
- New integration test `TeXmacs/tests/7003.scm` (8 checks: titled, plain, and a titled proof containing a
  plain one).

## Verified (Windows, release build, headless)

- `TeXmacs/tests/7003.scm`: **3 of 8 checks fail on unmodified `upstream/main`, 8 of 8 pass with the
  change** (`attachments/test-7003-*.txt`).
- Converting `attachments/proof.tex`: output before `attachments/proof-before.tmu`, after
  `attachments/proof-after.tmu`.
- Exporting the imported document back to LaTeX produced `\begin{proof*}{Proof of Theorem 1} ... \end{proof*}`
  with a generated `\newenvironment{proof*}[1]{\begin{proof}[{#1}]}{\end{proof}}`, i.e. it is a valid
  round trip through the exporter's existing path.

## Not checked

- Opening the result in the GUI and looking at the rendered heading.
- `\begin{proof}[...]` in styles other than the default article style, and proofs aliased by the importer
  (`pf`, `dem`, `preuve`, `IEEEproof`) with an option.
- The exported LaTeX was not compiled with TeX.
- macOS and Linux (all work was on Windows 11); the test was run by a hand-made headless command, not
  `xmake r 7003`.

## How this fix was made

Developed through human-aided debugging: I reported the problem and ran and checked the builds, and the
cause was worked out interactively with an AI assistant. The code was written using Claude Sonnet 5.5
(Anthropic); I reviewed and tested it before submitting. The commit carries a `Co-Authored-By` trailer to
the same effect.
