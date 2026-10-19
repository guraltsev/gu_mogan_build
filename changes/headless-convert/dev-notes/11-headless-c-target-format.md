# 11 - Headless `-c` export to plugin formats (`.tex`, `.bib`, ...)

Patch: `0011-Fix-headless-c-export-to-formats-provided-by-plugins.patch`
(follow-up to patch 2; one block in `src/System/Boot/init_texmacs.cpp`)

## Symptom
`MoganSTEM -headless -c in.tm out.tex` produced a 7-byte file containing only the
paragraph text: no preamble, no `\begin{equation}`. Same for any equation.

## Cause
The generated Scheme looked up `(url-format target)` **before** any plugin was
initialised. The `latex` format is registered by the latex plugin, and the output
file normally does not exist yet, so the answer was `generic` and the buffer was
exported as plain text. (`.tmu`/`.tm`/`.pdf` are built in, which is why only
plugin formats were hit.)

Measured with `format-from-suffix`: before `(lazy-plugin-force)` `tex -> generic`;
after it `tex -> latex`, `bib -> bibtex`, `html -> html`, `txt`/`xml -> generic`
(no plugin for those).

## Fix
In the default branch of the `-c` handling:
- `(lazy-plugin-force)` first (about 1 s);
- target format from the suffix: `(format-from-suffix (url-suffix target))`;
- source format still from `url-format` (the file exists, content is inspected).

## Verified
`../../../tests/headless-conversion/run-tests.sh`: 31/31 with this build. The
same tests against the build without this patch fail 16 checks, all in
`tm -> tex`, `tmu -> tex` and the `tex -> tex` round trip.

## Caveats
- The `.pdf` branch and the `tex -> tmu` special branch were not touched.
- An untitled buffer exported from Scheme (`buffer-export` on `(new-buffer)`)
  still printed `Error: bad format or data`; not part of the `-c` path, see
  `../../../issues/headless-c-conversion-broken.md`.
- Formatted with `gf fmt` (additions only in the diff).
