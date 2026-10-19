**Branch:** `pr/skip-remote-cursors-on-repaint` (1 commit, `3d700d137`) -> `MoganLab/mogan:main`

**Title:** `[NNNN] Skip the whole-document conversion in get_remote_cursors when there are no remote cursors`

---

## What happened

I was working on a long mathematical paper (about 870 KB of TeXmacs source) in Mogan
STEM. Opening it took around 30 seconds, and the editor was almost unusable afterwards:
even *scrolling* was very slow, with no typing involved. Short documents were fine, so
something in the editor was doing work proportional to the size of the document every
time the screen was redrawn.

## Problem

In a large document, scrolling and editing are slow even when no collaboration is
active. In a 870 KB / about 10 000-line document, each repaint took roughly
100-300 ms.

## Cause

`edit_modify_rep::get_remote_cursors()` (`src/Edit/Modify/edit_collab.cpp`) is called
from `edit_interface_rep::draw_remote_cursors`, which `draw_post` calls on **every
repaint**. It built `tree_to_linear_ir (the_buffer ())` for the entire buffer
*before* looking at `remote_cursors`. Without collaboration that array is always
empty, so every repaint (and so every scroll step and keystroke) cost O(document
size) for no result.

I found this by sampling the call stack of the running application (Windows, a
`releasedbg` build, `cdb` attached non-invasively) while scrolling: 33 of the 34
non-idle samples were in
`repaint_invalid_regions > draw_with_stored > draw_post > draw_remote_cursors >
get_remote_cursors > tree_to_linear_ir > emit_node`.

## Change

Return an empty result before building the linear IR when `remote_cursors` is empty.
One file, 4 lines. Behaviour with remote cursors present is unchanged (same code path).
`collab_cursor_payload` also calls `tree_to_linear_ir`, but it is guarded by
`loro_collab_on` and cached by cursor path, so it is not touched here.

## Measured

From the application's own `std-bench` log lines, same document, same machine,
release-with-debug-info build:

| | before | after |
|---|---|---|
| `repaint_invalid_regions`, average | about 220 ms | 17 ms (maximum 26 ms) |
| initial typeset of the document | 7.7 s | 3.2 s |

## Not checked

- Collaboration (loro) mode was not exercised; the only change is the early return
  when no remote cursor exists.
- macOS and Linux were not tested.
- No automated test; the effect is a performance one.

## How this fix was made

The fix was developed through human-aided debugging: I reported the symptoms, ran the
builds and checked the results by hand, and the cause was worked out interactively with
an AI assistant. The code itself was written using Claude Sonnet 5.5 (Anthropic). I
reviewed and tested it before submitting. The commit carries a `Co-Authored-By` trailer
to the same effect.
