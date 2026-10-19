**Title:** `Pressing Enter inside an aligned block nests the table instead of adding a row`

**Labels (suggested):** bug, editor

---

## Summary

In an `aligned` block that already contains a table, Enter wraps everything typed so far
into the first cell of a new table. Each Enter adds one more level, so the equation turns
into a staircase of nested tables.

## Environment

- Mogan STEM built from `main` at `c68a494fc`, xmake mode `releasedbg`
- Windows 11 Enterprise, Qt 6.8.3

## Steps to reproduce

In the application I saw this while typing in an `aligned` equation. A headless
reproduction (no GUI needed):

1. Make a formula in a text paragraph that contains an `aligned` whose argument is a table
   with one row of two cells, `a` and `=b`, and put the cursor in the first cell. (The
   block I used was built directly as the tree
   `(aligned (tformat (table (row (cell "a") (cell "=b")))))`; an `aligned` made with
   `(make 'aligned)` also contains a table.)
2. Load the module `table-edit` before `math-edit`.
3. Press Return, type `x`, press Return, type `y`.

## Expected

Three flat rows: `a | =b`, `x`, `y`.

## Actual

After two Return presses the original table sits inside two extra nested tables, and
`x` and `y` are in different tables at different levels. Reduced to the tree:

```
(aligned (tformat (table (row (cell (tformat (table (row (cell (tformat (table (row
  (cell "a") (cell "=b")))) ...
```

With the two modules loaded in the other order, the same key presses are expected to give
flat rows (I saw flat rows when `math-edit` was loaded first), which makes the problem
order dependent and hard to reproduce.

## Analysis

`TeXmacs/progs/math/math-edit.scm` defines a `kbd-enter` for `aligned` that assumes the
content is **one plain formula**: it splits it at the first relation into two columns and
`tree-set!`s a new `tformat`/`table` around it. It never checks whether the content is
already a table. An `aligned` made with `make` already contains one, so the handler wraps
the existing table into a cell.

The correct behaviour, adding a row, is the generic `kbd-enter` for `table-markup-context?`
in `table-edit.scm`. Both are `tm-define` clauses with `:require`, and the later definition
wins, so which applies depends on module load order.

## Fix

Require `(not (table-markup-context? t))` in the legacy clause, so that it only handles
the old form `(aligned "a=b+c")`. Pull request: branch `aligned-enter-nesting`. With it, the
same key presses give three flat rows in both load orders; the legacy plain-formula form
still converts to a table.

## Notes

The diagnosis was worked out interactively with an AI assistant (Claude Sonnet 5.5); I saw
the staircase in the application and reproduced it headlessly on a clean build by hand.
