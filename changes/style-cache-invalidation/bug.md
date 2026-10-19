**Title:** `A macro added to a style package is invisible in documents whose style was cached earlier (style cache is never invalidated)`

**Labels (suggested):** bug

---

## Summary

The compiled-style cache is keyed only by the style name and never checked against the
package files, so a style compiled before a package changed keeps being used. A macro added
to a package afterwards shows up as an unknown tag in such documents.

## Environment

- Mogan STEM built from `main` at `c68a494fc`; cache folder
  `%LOCALAPPDATA%\moganlab\system\cache\2026.3.8-rc.1\`
- Windows 11 Enterprise, Qt 6.8.3

## What happened

I added a new environment, `gathered`, to `TeXmacs/packages/environment/env-math.stem` and
installed the build. In a document using the default `generic` style, `gathered` was drawn
as an unknown framed tag `<gathered|...>`. The same content in an `article` document
rendered correctly. Deleting the user settings folder `%APPDATA%\moganlab` made no
difference.

A minimal reproduction with a trivial macro has not been tried; the sequence above is how
I met it.

## Evidence

The cache folder contained one `<md5>.scm` file per style combination. Five of them, written
before `gathered` existed, did not contain the word `gathered` at all; every file written
after that did. With an empty cache the same document renders the macro correctly in
`generic`.

## Cause

In `src/Data/Document/new_style.cpp`:

- `cache_file_name` builds the key from the style names only (for names without a
  `.ts`/`.stem` suffix, such as `generic` and `article`); nothing in it reflects the content
  or date of the package files the style loads.
- `style_set_cache` does not overwrite an existing entry, and `style_get_cache` performs no
  freshness check.

The cache folder is keyed only by the application version string, so every build with the
same version (an installed copy and local builds) shares it, and a stale entry written by
any of them is used by all.

## Fix

Add a stamp to the cache key: the newest modification time and the number of the
`*.ts`/`*.stem` files in the style and package directories, scanned once per process. Any
changed or added package file then produces a new cache name; old entries are no longer
hit. Pull request: branch `style-cache-invalidation`.

## Notes

The diagnosis was worked out interactively with an AI assistant (Claude Sonnet 5.5); I
observed the symptom and inspected the cache files by hand.
