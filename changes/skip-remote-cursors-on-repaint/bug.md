**Title:** `Scrolling and editing are very slow in large documents (every repaint converts the whole document)`

**Labels (suggested):** bug, performance

---

## Summary

In a large document, scrolling is very slow even though nothing is being typed and no
collaboration is active. Every repaint costs time proportional to the size of the
document.

## Environment

- Mogan STEM built from `main` at `c68a494fc` ([6026]), xmake mode `releasedbg`
  (release with debug info), `--loro=yes`
- Windows 11 Enterprise, Qt 6.8.3 (msvc2022_64)

## What I saw

Working on a long mathematical paper (about 870 KB and 10 000 lines of TeXmacs source,
roughly 250 labels and 40 citations), opening the file took around 30 seconds, and
afterwards even plain scrolling with the mouse wheel was very slow. Short documents on the
same machine were fine.

## Steps to reproduce

1. Open a large `.tm`/`.tmu` document (several hundred KB or more). I have not built a
   synthetic one; the effect was seen with the paper above.
2. Scroll up and down, or press the arrow keys.
3. Look at the log file (`%APPDATA%\moganlab\system\<date>.log` in a build that prints
   `std-bench` lines).

## Expected

Scrolling costs about the same in a large document as in a small one.

## Actual

`repaint_invalid_regions` takes 100-300 ms per repaint (average about 220 ms over the
samples I took); the initial typeset of the document took 7.7 s. In a short document the
same log never reported a repaint above 10 ms.

## Cause

`edit_modify_rep::get_remote_cursors()` (`src/Edit/Modify/edit_collab.cpp`) is called from
`edit_interface_rep::draw_remote_cursors`, which `draw_post` runs on every repaint. It
builds `tree_to_linear_ir (the_buffer ())` for the whole buffer before looking at
`remote_cursors`. Without collaboration that array is empty, so the conversion is wasted
work on every repaint.

I found this by sampling the call stack of the running application while scrolling (`cdb`,
non-invasive attach): 33 of the 34 non-idle samples were in
`repaint_invalid_regions > draw_with_stored > draw_post > draw_remote_cursors >
get_remote_cursors > tree_to_linear_ir > emit_node`.

## Fix

Return early from `get_remote_cursors()` when `remote_cursors` is empty (4 lines). With
it, repaints in the same document took 17 ms on average (maximum 26 ms) and the initial
typeset 3.2 s. Pull request: branch `skip-remote-cursors-on-repaint`.

## Notes

The diagnosis was worked out interactively with an AI assistant (Claude Sonnet 5.5); I
reproduced the slowness and checked the measurements by hand.
