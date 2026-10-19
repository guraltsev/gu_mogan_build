# Headless `-c` conversion: what was broken, what is fixed

Started 2026-10-17 as "the `-c` route is very broken". Mostly **my test files were
wrong**; one real bug was found and fixed. Current state:

## Resolved

1. **tm -> tex wrote only the plain text** (equations and preamble dropped).
   Real bug, from patch 2's `-c` code: the target format was looked up with
   `(url-format target)` before the latex plugin was loaded, giving `generic`.
   Fixed by patch 11 (`format-from-suffix` after `(lazy-plugin-force)`).
   Covered by `tests/headless-conversion/run-tests.sh`.

## Retracted: "`\\` row separators become `*`" (not a Mogan bug)

A **test-input artifact**. The `.tex` files I created through the shell tool had
every `\\` collapsed to a single `\`; backslash-space is TeX's control space, which
Mogan imports as `*`. With correct input `tex -> tmu` splits rows for `aligned`,
`array`, `pmatrix` and (patches 6/7) `gathered`.

**Trap:** do not write LaTeX fixtures with shell heredocs or `printf`. Check with
`od -c` that two backslashes are present, or use the Write tool. The runner
refuses fixtures without `\\`.

## Still open

- **Untitled buffer export fails.**
  `(buffer-export (current-buffer) url "latex")` from a fresh `(new-buffer)`
  prints `Error: bad format or data` and writes a tiny file. Possibly the same
  cause (format name resolved before plugins are loaded) or just the untitled
  buffer; not investigated. `(buffer-export source target "latex")` on a loaded
  file works.
