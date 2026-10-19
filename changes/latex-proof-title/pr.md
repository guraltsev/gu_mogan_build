**Branch:** `pr/latex-proof-title` (2 commits) -> `MoganLab/mogan:main`

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
  `proof` and `proof-of` are built on, and the tag the editor uses for a proof with its own title, so the title
  replaces the word "Proof" instead of being appended to it.
- Because the end marker has no option, `finalize_layout` keeps a small stack recording whether each open
  proof was titled, and closes it with `render-proof` or `proof` accordingly. Untitled and nested proofs
  behave as before.
- Export (second commit): `tmtex-render-proof` in `convert-latex-tmtex.scm` wrote a custom `proof*`
  environment, defined in the preamble as a wrapper around `\begin{proof}[...]`. It now writes
  `\begin{proof}[Title]` directly, or a plain `\begin{proof}` for an empty title (what the editor leaves
  when the title of a proof is made editable). This is the same direction as #2985 / #2990, which fixed the
  `proof` and `proof*` tags but not `render-proof`, so a titled proof still did not round-trip.
- `render-proof` is the tag Mogan itself uses for a proof with its own title (the editor converts
  `proof` into `render-proof` when the title is made editable), so it is the right target for the import.
- New integration test `TeXmacs/tests/7003.scm` (17 checks: import of titled, plain and nested proofs,
  export of titled, empty-title and plain proofs, and import followed by export).

## Verified (Windows, release build, headless)

- `TeXmacs/tests/7003.scm`: **3 of the 8 import checks fail on unmodified `upstream/main`; all 17 checks pass with the
  changes** (`attachments/test-7003-*.txt`).
- Converting `attachments/proof.tex`: output before `attachments/proof-before.tmu`, after
  `attachments/proof-after.tmu`.
- The import-then-export check in the test gives `\begin{proof}[Proof of Theorem 1]` with no `proof*` and
  no `newenvironment`. Before the export change the same document came out as `\begin{proof*}{...}` plus a
  generated wrapper environment.

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
