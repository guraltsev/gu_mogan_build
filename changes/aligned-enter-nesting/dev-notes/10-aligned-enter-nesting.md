# 10 - Enter in `aligned` nested tables instead of adding a row

Patch: `0010-Fix-Enter-in-aligned-nesting-the-table-instead-of-ad.patch`
(branch commit see `git log`; one line in `TeXmacs/progs/math/math-edit.scm`)

## Symptom
Pressing Enter inside an `aligned` produced a staircase of nested tables: each
Enter wrapped everything so far into the first cell of a new table, e.g.
`<aligned|<tformat|<table|<row|<cell|<tformat|<table|<row|<cell|<tformat|...`
(reported with a screenshot, 2026-10-17).

## Cause
`math-edit.scm` defines an old `kbd-enter` for `aligned` that assumes its content
is one plain formula: it splits the formula at the first relation into two
columns and `tree-set!`s a new `tformat/table` around it. It never checks whether
the content already is a table. Modern `aligned` (made with `make`, imported from
LaTeX, or built by patches 6/7/9) always contains one, so the handler wrapped the
existing table into a cell.

The correct behaviour (add a row) is the generic `kbd-enter` for
`table-markup-context?` in `table-edit.scm`. Which of the two applies depends on
which module was loaded last (later `tm-define` clauses win), so it appeared in
the GUI but not in my first headless tests, which loaded `table-edit` last.

## Fix
The legacy clause now requires `(not (table-markup-context? t))`, so it only handles
the old `(aligned "a=b+c")` form.

## Verified (headless, debug build)
Both module load orders:
- `aligned` with a table: Return, `x`, Return, `y` -> three flat rows (before the
  fix with `table-edit` loaded first: nested staircase, same as the screenshot);
- legacy `(aligned "a=b+c")`: Return still converts it to a table and adds a row.

## Not checked
- Other environments with similar legacy `kbd-enter` clauses (e.g. `eqnarray`).
- Real GUI typing; only simulated key presses.
- Documents already damaged by the staircase are not repaired.
