# `aligned` / `alignedat` support only two columns (no alternating r/l)

Found 2026-10-17. Status: **open, not fixed.** Findings come from reading the code;
the proposed workaround in the last section is untested.

## Problem

amsmath `aligned` alternates right/left alignment over any number of `&`-separated
columns (`rl rl rl ...`), e.g. `a &= b & c &= d` is two equations side by side.
Mogan only implements the two-column case.

`aligned*` in `TeXmacs/packages/environment/env-math.stem` (about lines 241-260):

- `table-min-cols` = `table-max-cols` = 2.
- Column 1: `cell-halign r`, `cell-lsep 0spc`, `cell-rsep 0.5spc`.
- Last column (`-1`): `cell-halign l`, lsep/rsep `0spc`.
- Nothing is set for the columns in between.
- `alignedat` / `alignedat*` take `ncol` but ignore it and call `aligned*`.
- `align`, `align*`, `alignat`, `flalign` have the same 2-column limit
  (`flalign` is just `align`).

## What happens on LaTeX import of a wider `aligned`

`parse_pmatrix` in `src/Plugins/Tex/fromtex_post.cpp` (about lines 500-515) builds a
table with as many columns as the widest row, padding short rows with empty cells.
Nothing is dropped and the content round-trips. But the formatting is wrong:

- Four columns come out as `r l l l` instead of `r l r l`.
- Middle columns get default cell padding instead of 0, so the gaps are wrong
  (amsmath puts space between each r/l pair, none between pairs).
- Anchors (`=`, etc.) in columns 3+ do not line up across rows.

`table-max-cols` does not cause trouble on import: it is only a "suggested" limit used
when editing (`edit_table_rep::table_get_limits`, `src/Edit/Modify/edit_table.cpp`
about lines 476-480). The typesetter never reads it. After import, table commands
that add columns probably refuse to go past 2.

The importer also treats `alignedat{n}` like `aligned`, ignoring `n`.

Not checked: the exporter should write extra columns back as `&` since it walks the
table, but this was not verified.

## Can TeXmacs express "alternating" alignment?

Not directly. `cwith` takes a start and end column (negative = from the end);
`extract_format` in `src/Typeset/Table/cell.cpp` (about lines 151-174) has no stride.

Possible workaround (untested):

- `cell-halign` is evaluated with `env->exec` (`cell.cpp` about line 251), so its
  value can be an expression.
- The typesetter sets the env variable `cell-col-nr` (0-based) per cell
  (`src/Typeset/Table/table.cpp` line 161).

So one rule over all columns might work:

```scheme
(cwith "1" "-1" "1" "-1" "cell-halign"
  (if (equal (mod (value "cell-col-nr") "2") "0") "r" "l"))
```

Open questions: whether `cell-col-nr` is already set when `cell-halign` is read,
whether `mod`/`value` evaluate there, and whether `cell-lsep`/`cell-rsep` are
evaluated the same way (needed for the per-pair spacing).

## Proposed fix

1. Try the expression-valued `cell-halign` on `aligned*` in the editor.
2. If padding cannot be expressed the same way, have the importer emit explicit
   per-column `cwith` rules from the actual column count (as it already does for
   empty columns), and drop the `table-max-cols` cap in the macro.
3. Make `alignedat` use `ncol`.
4. Check the exporter, and add a regression test (Scheme or import test) with a
   4-column `aligned`.
