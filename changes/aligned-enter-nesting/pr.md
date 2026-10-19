**Branch:** `aligned-enter-nesting` (1 commit, `e09cb601c`) -> `MoganLab/mogan:main`

**Title:** `[NNNN] Fix Enter in aligned nesting the table instead of adding a row`

---

## What happened

Inside an `aligned` equation, pressing Enter to start the next line did not add a line.
Instead the equation turned into a staircase: each Enter pushed everything typed so far
into the first cell of a new, deeper table, so the rows slid further to the right and
further down with every key press. (I have a screenshot of the staircase if it helps.)
In my tests the same Enter worked correctly when the two modules involved happened to
be loaded in the other order, which made it hard to reproduce.

## Problem

Pressing Enter inside an `aligned` can wrap everything typed so far into the first cell of
a new table instead of adding a row, producing a staircase of nested tables:

```
<aligned|<tformat|<table|<row|<cell|<tformat|<table|<row|<cell|<tformat|<table|...
```

(one level added per Enter).

## Cause

`TeXmacs/progs/math/math-edit.scm` defines a `kbd-enter` for `aligned` that assumes the
content is **one plain formula**: it splits it at the first relation into two columns and
`tree-set!`s a new `tformat`/`table` around it. It never checks whether the content already
is a table. An `aligned` made with `make` already contains one, so the handler wraps the
existing table into a cell.

The correct behaviour (add a row) is the generic `kbd-enter` for `table-markup-context?`
in `table-edit.scm`. Both are `tm-define` clauses with `:require`, and the later definition
wins, so which one applies depends on the order in which the two modules were loaded. That
is why it shows in the application but not in every script.

## Change

One line: the legacy clause now requires
`(and (tree-is? t 'aligned) (not (table-markup-context? t)))`, so it only handles the old
form `(aligned "a=b+c")`.

## Verified (headless key-press simulation)

I loaded `table-edit` before `math-edit` (the unfavourable order) and pressed Return, `x`,
Return, `y` in an `aligned` with a table `[a | =b]`, on a clean build of `main`
(`c68a494fc`) and on this branch:

- `main`: nested tables, as in the report above (each Return adds a level: after two Returns the
  original table `[a | =b]` sits inside two extra tables);
- this branch: three flat rows;
- the legacy plain-formula form `(aligned "a=b+c")` still converts to a table and adds a
  row, as before.

## Not checked

- Other legacy `kbd-enter` clauses in `math-edit.scm` (for example for `eqnarray`) were
  not examined for the same problem.
- Documents already damaged by the nesting are not repaired.
- Only simulated key presses, not a physical keyboard, on Windows.

## How this fix was made

The fix was developed through human-aided debugging: I reported the symptoms, ran the
builds and checked the results by hand, and the cause was worked out interactively with
an AI assistant. The code itself was written using Claude Sonnet 5.5 (Anthropic). I
reviewed and tested it before submitting. The commit carries a `Co-Authored-By` trailer
to the same effect.
