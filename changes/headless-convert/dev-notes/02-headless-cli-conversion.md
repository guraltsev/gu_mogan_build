# 02 - Headless CLI file conversion

Patch: `0002-Fix-headless-file-conversion.patch`
(original commit `1fc351f77`; re-resolved onto upstream as `2270ce77e`)

## What
`MoganSTEM -headless -c <in> <out>` converts between formats by loading and
exporting the buffers addressed by the input and output URLs explicitly.

## Why
In headless mode there is no active view, so `(load-buffer ...)` followed by
`(export-buffer ...)` depends on `current-buffer` and can fail or export the wrong
buffer. The new code does not depend on any current buffer.

## How
`src/System/Boot/init_texmacs.cpp`, in the `-c` handling, default branch. The
generated Scheme is roughly:
```scheme
(let* ((source (system->url IN)) (target (system->url OUT))
       (source-format (url-format source)) (target-format (url-format target)))
  (plugin-initialize (string->symbol source-format))
  (plugin-initialize (string->symbol target-format))
  (if (buffer-load source)
      (display* "TeXmacs] Could not load " ...)
      (when (buffer-export source target target-format)
        (display* "TeXmacs] Could not export " ...))))
```
`plugin-initialize` for both formats makes the converters available. Errors are
printed, then `(quit-TeXmacs)` runs as before.

### Merge note
Upstream main meanwhile added a PDF special case that expands screens into slides
(`export-buffer-to-pdf`). The resolution keeps it:
- `out_suffix == "pdf"`: `(load-buffer IN :strict) (export-buffer-to-pdf OUT)`
- otherwise: the headless-safe `let*` form above.

So the PDF path is **not** covered by this fix.

## Verify
`xmake run stem -headless -c t.tex t.tmu` exits 0 and writes `t.tmu`
(confirmed 2026-10-17; run `xmake install --yes stem` first).

## Caveats
- Headless PDF export is unchanged and untested.
- Load/export failures are only printed; the process still exits 0.
