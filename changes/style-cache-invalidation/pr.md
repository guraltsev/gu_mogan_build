**Branch:** `style-cache-invalidation` (1 commit, `0ec96f773`) -> `MoganLab/mogan:main`

**Title:** `[NNNN] Make the style cache notice changed style and package files`

---

## What happened

I added a new environment (`gathered`) to one of Mogan's style packages and installed
the result. In documents using the default `generic` style it showed up as an unknown
framed tag, `<gathered|...>`, instead of a formula, while the same content looked
correct in an `article` document. Deleting my user settings folder changed nothing,
and the macro really was in the package file. The editor was using an older, saved copy
of the compiled style and never noticed that the package had changed.

## Problem

After a macro is added to a style package, documents whose style was compiled *before*
the change never see it. Concretely: I added `gathered` to
`TeXmacs/packages/environment/env-math.stem`. In documents using the `generic` style
it was drawn as an unknown tag (a framed `<gathered|...>` box) while documents in
`article` rendered it correctly. Deleting the user settings directory did not help.

## Cause

Compiled styles are cached in
`%LOCALAPPDATA%\moganlab\system\cache\<app version>\<md5>.scm`. In
`src/Data/Document/new_style.cpp`:

- `cache_file_name` builds the key from the style **names** only (for names without a
  `.ts`/`.stem` suffix, which includes `generic` and `article`). Nothing in the key
  reflects the content or date of the package files that style loads.
- `style_set_cache` never overwrites an existing entry, and `style_get_cache` does no
  freshness check.

So an entry written before the package changed is used indefinitely. The cache
directory is keyed by version number only, so every build with the same version
string (an installed copy and local builds) shares it.

Evidence from the cache directory: five entries written before `gathered` existed
contained no occurrence of it, all entries written afterwards did.

## Change

`package_files_stamp ()` computes, once per process, the newest modification time and
the number of `*.ts`/`*.stem` files in `$TEXMACS_PATH/{packages,styles}` and
`$TEXMACS_HOME_PATH/{packages,styles}` (directly and one directory level down), as
`"<mtime>-<count>"`. It is appended to the string that is hashed for the cache file
name. Any added, removed or modified package file gives a new cache name; old entries
simply stop being hit.

## Verified

- With an empty cache, the first export created 4 cache files. After touching
  `env-math.stem`, the next export created 3 new ones instead of reusing the old ones.
  A further export reused them (no growth).
- A document with the style stack that previously showed the unknown tag now renders
  the macro (checked on the PDF export).

## Limits and not checked

- The stamp is the maximum modification time plus a count: replacing a file by an
  older one with the same count would not change it. Directories deeper than two
  levels are not scanned.
- Old cache files stay on disk (a few hundred KB each); this change does not delete
  them.
- First start after an upgrade recompiles the styles it needs (a few seconds).
- The time for the one-off directory scan was not measured.
- Windows only.
- The `-delete-style-cache` option does not remove these cache files either (it deletes
  `__*`, while the files are named `<md5>.scm`). I have not changed that here.

## How this fix was made

The fix was developed through human-aided debugging: I reported the symptoms, ran the
builds and checked the results by hand, and the cause was worked out interactively with
an AI assistant. The code itself was written using Claude Sonnet 5.5 (Anthropic). I
reviewed and tested it before submitting. The commit carries a `Co-Authored-By` trailer
to the same effect.
