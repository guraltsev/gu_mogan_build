**Branch:** `latex-nested-norms` (1 commit, `92a7ac6e0`) -> `MoganLab/mogan:main`

**Title:** `[NNNN] Keep nested norms and absolute values apart in LaTeX import and export`

---

## What happened

A formula such as the norm of a norm, written in LaTeX as

```
$\|{\|f(x,y)+g(x,y)\|_{L^q}}\|_{L^p}$
```

was imported wrongly: the first two bars were paired into an empty fence and the last two
into another, instead of an outer norm around an inner one. Exporting a correctly nested
document produced `\|\|f\|_{L^q} \|_{L^p}`, which reads back wrongly in the same way (and
nested absolute values `||f|_q |_p` likewise).

## Cause

- Import: the braces survive parsing but are dropped before brackets are paired, and the
  pairing takes the nearest equal bar, so `\|\|` is always read as one empty pair.
- Export: nested `around` nodes are flattened to plain delimiter characters before the
  LaTeX is written, so nothing marks the inner pair.

## Change

- Import (`src/Plugins/Tex/fromtex.cpp`): in math mode, `bar {group} same-bar` becomes one
  `around` whose body is the converted group, paired independently of the outside.
- Export (`convert-latex-tmtex.scm`): a small (non-`\left`) bar pair whose body contains a
  pair of the same bar gets its body wrapped in braces: `\| {\|f\|_{L^q}} \|_{L^p}`.
  Controlled by the converter option `texmacs->latex:protect-nested-bars` (default on),
  exposed as a checkbox in Preferences > Convert > LaTeX.

## Verified (Windows, releasedbg, headless conversion)

- Import of the braced form gives a norm of a norm; the unbraced form is unchanged.
- Export gives `\| {\|f ...\|_{L^q}} \|_{L^p}` and `| {|f|_q} |_p`; single and sibling
  norms and mixed bars (`‖ |f| ‖`) are unchanged.
- Option off restores the old output; unset counts as on.
- Round trip tex -> tmu -> tex -> tmu gives identical trees.
- 40 local conversion checks pass.

## Not done

- The unbraced `\|\|f\|\|` stays ambiguous and is read as before.
- Only `bar {group} bar` is recognised on import; other symmetric delimiters are not.
- No option for the importer; no Chinese UI string for the new checkbox.
- Not tried on a large real document.

## How this fix was made

Developed through human-aided debugging: I reported the problem and ran and checked the
builds, and the cause was worked out interactively with an AI assistant. The code was
written using Claude Sonnet 5.5 (Anthropic); I reviewed and tested it before submitting.
The commit carries a `Co-Authored-By` trailer to the same effect.
