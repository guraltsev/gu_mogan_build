**Type:** issue (no branch)

**Title:** `-delete-style-cache` and `style_clear_cache` delete files named `__*`, but style cache files are named `<md5>.scm`

---

## Summary

Two places try to clear the compiled-style cache by removing files that match `__*` in
the cache directory:

- `src/Mogan/Research/research.cpp`, the `-delete-style-cache` option:
  `remove (get_tm_cache_path () * url_wildcard ("__*"))`
- `src/Data/Document/new_style.cpp`, in the function that clears the style cache:
  the same call.

But `cache_file_name` in `new_style.cpp` names the cache files
`lolly::hash::md5_hexdigest (tmp) * ".scm"`, i.e. `<32 hex digits>.scm`, with no `__`
prefix (the `__` only appears *inside* the hashed text). So the wildcard matches nothing.

## What I observed

On Windows (a local `releasedbg` build), the cache directory
`%LOCALAPPDATA%\moganlab\system\cache\<version>\` contained several `<md5>.scm` style
files. After starting the application once with
`-delete-style-cache`, all of them were still there. I did not determine whether the
STEM executable uses the code in `research.cpp` or only the option list in
`init_texmacs.cpp` (where the flag is accepted and ignored); the files were not removed
in either case.

## Why it matters

A cached style is not refreshed when a package file changes, so a macro added to a
package later can stay invisible in documents whose style was compiled earlier. The
documented way to clear the cache does not work, so users have to find and delete the
files by hand. The folder is also shared by every build with the same version string.

## Suggested direction (not a patch)

Either remove only the style entries by recognising their names (hex digest plus
`.scm`, excluding `font_*`, `plugin_cache.scm`, `validate_cache.scm` and similar), or keep
the style entries in a subdirectory or under a distinctive prefix so that a wildcard can
select them. I did not write a change because the right naming scheme is your decision.
