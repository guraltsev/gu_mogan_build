**Branch:** `pr/latex-proof-title` (2 commits) -> `MoganLab/mogan:main`

**Title:** `[NNNN] LaTeX: round-trip \begin{proof}[Title] as a titled proof`

---

## What happened

Importing a LaTeX proof with an optional title, such as `\begin{proof}[Proof of Theorem 1] ... \end{proof}`,
silently destroyed the environment: the title and the `proof` block were gone and the body was left as a
plain paragraph. A proof without a title imported correctly. Separately, a titled proof inside Mogan was
exported as a custom `proof*` environment rather than `\begin{proof}[Title]`, so even with the import
repaired the round trip would not have produced the original LaTeX.

Input used (`proof.tex`):

```latex
\documentclass{article}
\usepackage{amsthm}
\begin{document}

\begin{proof}[Proof of Theorem 1]
Because $x$.
\end{proof}

\begin{proof}
Plain.
\end{proof}

\end{document}
```

Output of `MoganSTEM.exe -headless -c proof.tex proof.tmu` on unmodified `upstream/main` (the titled proof is
gone):

```
<TMU|<tuple|1.1.0|2026.3.0>>

<style|<tuple|article|std-latex>>

<\body>
  Because <math|x>.

  <\proof>
    Plain.
  </proof>
</body>
```

Output with this change (title and environment kept):

```
<TMU|<tuple|1.1.0|2026.3.0>>

<style|<tuple|article|std-latex>>

<\body>
  <\render-proof|Proof of Theorem 1>
    Because <math|x>.
  </render-proof>

  <\proof>
    Plain.
  </proof>
</body>
```

## How the importer works here (background)

Importing is a pipeline: `parsetex.cpp` parses the LaTeX into a tuple tree; `fromtex.cpp` converts it; then
`fromtex_post.cpp` post-processes. In the parse tree an environment is a pair of markers,
`(tuple "\begin-NAME" ...args)` and `(tuple "\end-NAME")`. When the parser consumes an optional argument
of an environment it appends `*` to the begin marker's name and stores the option as an argument. So
`\begin{proof}[Title]` becomes `\begin-proof*` with argument `Title`, but its `\end{proof}` stays
`\end-proof`: the end marker never learns about the option. Post-processing then turns these markers into
Mogan's `BEGIN`/`END` nodes that become `<\name> ... </name>` blocks.

## Cause

In `finalize_layout` (`src/Plugins/Tex/fromtex_post.cpp`), the branch that handles theorem-like
environments with an option is

    if (is_func (v, BEGIN, 2) && is_enunciation (v) && v[0] != "proof*")

It rewrites `theorem*` + option into `<theorem>` followed by `<dueto|option>`. It excludes `proof*`
explicitly, and no other branch in `finalize_layout` names `proof*`. I did not trace exactly which later
stage discards the leftover `proof*` begin marker (the generic branch for admissible environments would
pass it on, but the final tree contains no trace of it); the observable result is that neither the begin
nor the end marker of a titled proof survives, and the fix below does not depend on that detail because
the marker is now replaced before it reaches those stages.

## Change

### 1. Import (`src/Plugins/Tex/fromtex_post.cpp`, `finalize_layout`)

- A titled proof (`BEGIN "proof*"` with one argument) is emitted as `BEGIN "render-proof"` with the title
  as its argument, i.e. `<\render-proof|Title>`.
- Choice of `render-proof`: it is the tag Mogan uses for a proof with its own title. `text-edit.scm`
  rewrites `proof` into `(render-proof "" body)` when the title is made editable, and `text-drd.scm` puts it
  in the `titled-tag` group, so it is the editor's own form for this, not an internal helper. Its
  title replaces the word "Proof", as in LaTeX. The alternative `proof-of` prepends "Proof" and would show
  "Proof Proof of Theorem 1". The theorem-style `<dueto|...>` appends a parenthesised name after the
  default heading and would also be wrong here.
- Pairing the end marker: `finalize_layout` now keeps a small stack (`array<bool> titled_proofs`) local to
  the concatenation it is processing. Every begin marker of a proof pushes whether it was titled
  (`proof*`) or not (`proof`); every `(END "proof")` pops, and emits `END "render-proof"` for a titled
  one and leaves a plain one untouched. Nesting is therefore handled by stack discipline: a titled proof
  that contains a plain proof, or the reverse, closes each with the right tag.
- Untitled proofs take exactly the path they took before (the extra code only records `false` on the
  stack), so their output is unchanged.

### 2. Export (`TeXmacs/plugins/latex/progs/latex/convert-latex-tmtex.scm`, `tmtex-render-proof`)

- `render-proof` was exported as `(!begin "proof*" title)`, i.e. a custom environment `proof*`; the
  generated preamble then defined `\newenvironment{proof*}[1]{\begin{proof}[{#1}]}{\end{proof}}` and the
  body used `\begin{proof*}{Title}`. It now produces `(!begin "proof" (!option title))`, i.e.
  `\begin{proof}[Title]` directly, the same shape `latex-define.scm` already uses for the `proof*` tag.
- An empty title (what the editor leaves after the title of a proof is made editable) exports as plain
  `\begin{proof}`, so a proof whose title was never filled in does not get an empty `[]`.
- The `amsthm` package dependency is already declared for `begin-proof`, so no preamble change is needed.
- This is the same direction as #2985 / #2990 (export of `proof` and `proof*` as `\begin{proof}`, tests in
  #3052). Those changes target the `proof` and `proof*` tags; they do not cover `render-proof`, which is
  what a titled proof is, and they do not touch the importer.

### 3. Tests (`TeXmacs/tests/7003.scm`, 17 checks)

Import: titled proof gives `render-proof`, keeps the title and body, and no `proof`; plain proof gives
`proof` and no `render-proof`; titled proof containing a plain proof gives both. Export: titled proof gives
`\begin{proof}[Proof of Theorem 1]`, `\end{proof}`, and neither `proof*` nor `newenvironment`; empty title
gives `\begin{proof}` without `[`; plain `proof` still gives `\begin{proof}`. Round trip: importing the
LaTeX proof and exporting the result gives `\begin{proof}[Proof of Theorem 1]` with no `proof*`.

## Verified (Windows, release build, headless)

- `TeXmacs/tests/7003.scm` against unmodified `upstream/main`: the first 8 checks (import only) give
  `5 correct, 3 failed`; with the change all 17 checks pass (console output of the test run below).
- Converting `proof.tex` with `-headless -c`: outputs shown above; the plain proof is identical in both.

## Not checked

- Opening the result in the GUI and looking at the rendered heading and end-of-proof mark.
- Compiling the exported LaTeX with a TeX engine.
- `\begin{proof}[...]` in styles other than the default article style, and proofs aliased by the importer
  (`pf`, `dem`, `preuve`, `IEEEproof`) with an option; those aliases are renamed to `proof` before this
  code runs, so they should behave the same, but this was not tried.
- The full-file converter round trip (`.tex` -> `.tmu` -> `.tex`) end to end: the headless `.tmu` -> `.tex`
  step stopped writing output in my environment, so the round trip is covered by the Scheme test only.
- macOS and Linux (all work was on Windows 11); the test was run by a hand-made headless command, not by
  `xmake r 7003`.

## Test output

Unmodified `upstream/main` (import checks only, the first 8 of today's 17):

```
(contains? t 'render-proof) => #f ; *** failed ***
; expected result: #t
(contains? t "Proof of Theorem 1") => #f ; *** failed ***
; expected result: #t
(contains? t 'render-proof) => #f ; *** failed ***
; expected result: #t
; *** checks *** : 5 correct, 3 failed.
```

With this change:

```
; *** checks *** : 17 correct, 0 failed.
```

## How this fix was made

Developed through human-aided debugging: I reported the problem and ran and checked the builds, and the
cause was worked out interactively with an AI assistant. The code was written using Claude Sonnet 5.5
(Anthropic); I reviewed and tested it before submitting. The commits carry a `Co-Authored-By` trailer to
the same effect.
