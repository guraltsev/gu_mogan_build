# 13 - Style cache notices changed package files

Patch: `0013-Make-the-style-cache-notice-changed-style-and-packag.patch`
(`src/Data/Document/new_style.cpp`)

## Symptom
After patch 6 added the `gathered` macro, documents in the `generic` style showed
it as an unknown tag (`<gathered|...>` drawn as a framed box) while `article`
documents worked. Deleting `%APPDATA%\moganlab` changed nothing. The same
happened in a PDF export with the `preview-ref / number-long-article / smart-ref`
stack (screenshot and image checks, 2026-10-17).

## Cause
Compiled styles are cached in `%LOCALAPPDATA%\moganlab\system\cache\<app version>\<md5>.scm`.
The key (`cache_file_name`) only contains the style *names*, never the content or
date of the package files they load, and `style_set_cache` never overwrites an
existing entry. Anything cached before `env-math.stem` gained `gathered` (five
files from 14:28-14:32 here, none containing `gathered`) kept being used. All
builds with the same version string share that folder, installed copy included.

Also: `-delete-style-cache` removes `__*`, but the files are named `<md5>.scm`, so
it deletes nothing. (Not changed here.)

## Fix
`package_files_stamp ()`: once per process, scan `*.ts`/`*.stem` in
`$TEXMACS_PATH/{packages,styles}` and `$TEXMACS_HOME_PATH/{packages,styles}`
(directly and one level down), build `"<newest mtime>-<count>"`, and append it to the
string that is hashed for the cache name. A changed or added package file gives a
new name; old entries are ignored (they stay on disk, harmless, a few hundred KB each).

## Verified
- After clearing the cache, the first export created 4 cache files; touching
  `env-math.stem` and exporting again created 3 new ones; a repeat export reused them
  (7 files, no growth).
- The earlier broken style stack renders `gathered` correctly, numbered (0.1) and
  unnumbered, as a PDF image.
- 31/31 headless conversion tests pass.

## Caveats
- A file in a deeper directory, or one that is replaced by an older one with the
  same count and an older mtime than the newest, would not change the stamp.
- First start after installing a build recompiles styles (a few seconds).
- Old cache files are never deleted; `-delete-style-cache` is still ineffective.
- Worth sending upstream: it affects anyone who edits a package.
