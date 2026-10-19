# Local tests: headless file conversion (`MoganSTEM -headless -c in out`)

```
./run-tests.sh [--keep] [path/to/MoganSTEM.exe]
```
Run from Git Bash. Default executable:
`<mogan>/build/dist-releasedbg/bin/MoganSTEM.exe`. `--keep` leaves the converted
files in a temp directory (path printed at the end). Exit status 0 = all passed.
Takes about a minute (6 conversions, each starts Mogan).

## What is covered (31 checks)
| Direction | Fixture | Checks |
|---|---|---|
| tex -> tmu | `fixtures/blocks.tex` | `gathered` rows; `gathered[t]`/`[b]` valign; `aligned` rows; `aligned[t]` valign; no stray `<aligned|t|`; `array` and `pmatrix` rows; no `*` from a lost backslash |
| tm -> tex | `fixtures/equations.tm` | full document (not plain text); `\documentclass`; `\usepackage{amsmath}`; `equation` + `gathered` with both rows; `gather*`; `aligned`; `equation*` as `\[ ... \]`; plain text kept |
| tm -> tmu | same | `gathered` kept, three rows |
| tmu -> tex | output of the line above | `gathered` exported |
| tex -> tmu -> tex | `blocks.tex` | `gathered` and its rows come back |

## Results
- Build with patches 1-11: 31 passed, 0 failed.
- Build with patches 1-10 (no `-c` target-format fix): 15 passed, 16 failed, all
  in the three tex-export sections. This is how the tests were shown to detect
  the bug fixed by patch 11.

## Writing fixtures: a trap
**Never create `.tex` fixtures with shell heredocs or `printf`.** In this
environment they lost one backslash of every `\\`. A backslash-space is TeX's
control space, so rows did not split and the importer produced `*` instead. That
once looked like an importer bug (see `../../issues/headless-c-conversion-broken.md`).
Use an editor / the Write tool. `run-tests.sh` refuses to run when
`fixtures/blocks.tex` contains no `\\`.

## Adding a case
Put the input in `fixtures/`, add a `convert` line and `has`/`lacks` checks to
`run-tests.sh`. Expected `.tmu` strings are Mogan's serialisation, so copy them
from a `--keep` run.

## Not covered
- PDF export (`-c in out.pdf` has its own branch).
- Error handling (missing input file, unknown suffix): failures are only printed.
- Whether the written `.tex` compiles with LaTeX (only its text is checked).
