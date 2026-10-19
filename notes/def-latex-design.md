# Design: `def-latex`, a Mogan macro that carries its own hand-written LaTeX

Status: design only, nothing implemented. Everything would live in user space
(`user-config/`, no Mogan source change, no rebuild).

## 1. Goal

One construct in a Mogan document that defines **both**:

1. a Mogan macro (name, parameters, body), and
2. the LaTeX that the exporter writes for it, **written by hand**.

so that Mogan's own macro-export logic (expanding macros inline, generating
`\newcommand` for document macros) is never involved for these macros.

Today the same information is spread over three places per macro: a `.stem` package
(Mogan macro), a registry line plus preamble string in `latex-user-extensions.scm`,
and a `.sty` copy. The goal is one line per macro, in the document.

## 2. Non-goals

- No automatic generation of LaTeX (no derived `\newcommand`, no default call syntax).
- No import support: reading `\NewDocumentCommand` from a `.tex` preamble back into
  `def-latex` is a separate importer pass.
- Not a replacement for the registry in `latex-user-extensions.scm` (see section 7).

## 3. User-facing syntax

A tag placed in the document preamble (`hide-preamble`), provided by a small package
(`deflatex.stem`):

```
<def-latex | name | mogan-macro | latex-preamble | latex-call>
```

| Field | Meaning | Written by |
|---|---|---|
| `name` | Mogan tag name | hand |
| `mogan-macro` | a `(macro "p1" ... "pn" body)` value; arity is its parameter list | hand |
| `latex-preamble` | text written verbatim into the exported preamble, including any `\usepackage` lines it needs | hand |
| `latex-call` | how a use is written, with `#1`..`#n` for the converted arguments, e.g. `\lga[#1]{#2}` | hand |

Example (the existing `lga`):

```
name           lga
mogan-macro    (macro "align" "body" ... table ... )
latex-preamble \usepackage{mathtools}
               \NewDocumentCommand{\lga}{O{t} m}{\begin{lgathered}[#1]#2\end{lgathered}} % ...
latex-call     \lga[#1]{#2}
```

Rules:
- `latex-call` is **required**. Without it the macro is not exported as a LaTeX command
  (Mogan's default handling applies). There is no default `\name{a}{b}`.
- Mogan macros have only plain positional arguments. Optional and star forms are
  expressed in the template (`\lga[#1]{#2}`) or by two macros (`oper`, `operstar`);
  the template language has no conditionals.
- The LaTeX name may differ from the Mogan name (Mogan names may contain `-`).

## 4. Mogan side

`def-latex` is a package macro that expands to `(assign (arg "name") (arg "mogan-macro"))`
and ignores the LaTeX fields. Computed-name `assign` is already how Mogan's theorem
environments define macros, so this is expected to work. **Not yet tested** with a macro
passed as an argument (spike S1).

## 5. Export pipeline

Hook: an overload of `texmacs->latex` with `(:require #t)` (the same mechanism already
used in `latex-user-extensions.scm` for `\tmop` and the accents). It runs a pre-pass on
the document before calling `former`.

1. **Collect and strip.** Find every `def-latex` node in the preamble. Record
   `name -> (latex-preamble, latex-call)` in a per-export table, in document order,
   then remove the nodes. Removal matters: Mogan exports `hide-preamble` content as `%`
   comments (read from `comment-preamble` in `convert-latex-tmtex.scm`, not yet observed).
   Our node is not an `assign`, so Mogan's `collect-user-defs` (which turns preamble
   `assign`s into `\newcommand`) does not see it. An empty `hide-preamble` is dropped.
2. **Rewrite uses.** Replace every `(name a1 ... an)` in the body, and inside other
   macro bodies in the preamble, by `(latex-call "name" a1 ... an)`. Skip the name
   position of `assign` and `macro` parameter lists. Without this rewrite Mogan would
   expand the macro inline (it only keeps commands it knows from its DRD).
3. **One static handler** for `latex-call`, registered once in `tmtex-extra-methods%`
   (as the existing `lga`/`oper` handlers are). It looks up the template, converts each
   argument with `tmtex` (so math/text mode is handled by the exporter), and splits the
   template at `#k` into a LaTeX tree such as `(!concat "\\lga[" A "]{" B "}")`.
   It also marks the name as used. Because the handler is static and the table is
   per export, nothing leaks into other documents in the session.
4. **Preamble.** Overload `latex-extra-preamble` (it already has `:require` overloads
   in the elsevier style; its result is written right after the `\usepackage` lines).
   It returns, in document order, the `latex-preamble` text of the **used** macros,
   verbatim. Packages the code needs are the author's `\usepackage` lines inside it;
   the exporter adds none.
5. **Reset** the per-export table when the export ends (also on error, via
   `dynamic-wind`).

Already confirmed in this project (so the pieces exist): `texmacs->latex` overloads work
and cover both whole files and snippets; `logic-dispatcher` handlers on
`tmtex-extra-methods%` take precedence over macro expansion; preamble text can be added
conditionally (`latex-texmacs-preamble`, `latex-add-extra`); exports must be tested with
the real converter options (`use-macros` on), otherwise macros are expanded inline.

## 6. Problems and limits

- **Copy as LaTeX has no preamble.** A snippet cannot see the document's definitions, so
  uses would not be rewritten. Possible extension: read the definitions from the current
  buffer. Not required for the first version.
- **Style-package definitions are not in the document tree.** `def-latex` only covers
  macros defined in the document itself. A macro defined in a style package would need the
  exporter to read the compiled style (spike S4); unknown whether that is feasible.
- **No arity check** between the Mogan macro and the LaTeX code or template. A mismatch is
  the author's error and shows up as a LaTeX error. Possible lint: warn when the template
  uses `#k` beyond the macro's arity.
- **Sharing.** A document using `def-latex` needs the `deflatex` package. Authors can
  paste the one-line `def-latex` definition into the document preamble to make it
  self-contained.
- **Name clashes** with Mogan's built-in tags (we met `op`) are not detected. A document
  macro shadows a built-in tag of the same name.
- **Duplicates.** Two `def-latex` with the same name: last wins, with a warning.
- **Nested use** inside macro bodies and macro arguments is covered by the rewrite
  (step 2); correctness depends on walking `assign`/`macro` forms accurately.

## 7. Relation to what exists

`latex-user-extensions.scm` already does this per name, with the registry in Scheme and
the Mogan macro in a `.stem`. `def-latex` would not replace it for style-package macros
(section 6). Plausible split: keep the registry for the built-in shorthand set
(`\R`, `\mc`, accents, ...), use `def-latex` for macros that belong to one document.

## 8. Spikes (do these first, each small)

| | Question | Failure means |
|---|---|---|
| S1 | Does `(assign (arg "name") (arg "m"))` define a working macro when called from the preamble, with `m` a `(macro ...)` argument? | need another way to define the macro (a style-level `extern`/`new-macro`) |
| S2 | What does export do to an unknown tag inside `hide-preamble`? Is it a comment, text, or dropped? | adjust the strip step |
| S3 | Is `(!concat "str" tree "str")` serialised correctly, in math and text mode, by `serialize-latex`? Does the preamble hook `latex-extra-preamble` run after the body is converted? | choose a different tree shape or a different emission point |
| S4 | Can the exporter obtain the macros of the style packages in use (compiled style tree)? | style-package macros stay on the registry |

## 9. Test plan

New suite `tests/test-deflatex.scm`, same style as the others (export through the real
converter options, check body, preamble, comments, absence when unused):

- a document with one `def-latex`: use exported with the template; definition in the
  preamble; nothing about it in the body.
- definition present but macro unused: no preamble text.
- two macros, used in reverse order: preamble in document order.
- optional-argument template (`\lga[#1]{#2}`) and a two-macro star case.
- use inside another macro's body and inside an argument.
- missing template: not exported as a command, no crash.
- no per-export state leaks: export a second, plain document afterwards.
- no `\newcommand` anywhere; no `%`-commented copy of the `def-latex` node.
- snippet export: documents the known limitation (uses stay as the raw tag).

## 10. Open questions for the author

1. Tag name: `def-latex`, or something shorter?
2. Missing `latex-call`: silently not exported as a command (as above), or an export
   error? An error would be louder; the project preference so far is loud failure.
3. Should a `\usepackage` placed inside the preamble code be hoisted next to Mogan's
   own `\usepackage` lines, or stay where the code puts it (after them)? The design
   keeps it in place.
4. Is "only used macros are emitted" the rule for every definition, or should a flag
   force a definition to be always emitted?
