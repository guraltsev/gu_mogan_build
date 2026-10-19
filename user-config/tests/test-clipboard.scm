;; Copy / paste: LaTeX snippets (no document, no preamble) use different converters
;; (latex-snippet <-> texmacs) than whole files, so they are tested separately.
;; This covers the conversion layer only; the system clipboard itself is not
;; reachable headless (clipboard-set ends the process), see README.md.
(load (string-append (getenv "UC_TESTS") "/helpers.scm"))

(define (paste src)
  (tree->stree (convert src "latex-snippet" "texmacs-tree")))

(define (copy st)
  (convert st "texmacs-stree" "latex-snippet"))

(define (test-paste-symbols)
  (with d (paste (tex "x+" bs "R+" bs "C+" bs "mathbb{N}+" bs "mathbb Q"))
    (check (tree-mentions? d "<bbb-R>") => #t)
    (check (tree-mentions? d "<bbb-C>") => #t)
    (check (tree-mentions? d "<bbb-N>") => #t)
    (check (tree-mentions? d "<bbb-Q>") => #t)
    ;; unconverted commands would show up as zero-argument tags
    (check (tree-has? d '(R)) => #f)
    (check (tree-has? d '(C)) => #f)))

(define (test-paste-fonts)
  (check (normalize (paste (tex bs "mc{A}+" bs "mb{AB}+" bs "mbf{x}+" bs "mf{g}+" bs "ms{L}")))
         => (normalize (paste (tex bs "mathcal{A}+" bs "mathbb{AB}+" bs "mathbf{x}+"
                                  bs "mathfrak{g}+" bs "mathscr{L}"))))
  (with d (paste (tex bs "mc{A}"))
    (check (tree-has? d "<cal-A>") => #t)
    (check (tree-has? d '(mc "A")) => #f)))

(define (test-paste-oper-lga)
  (with d (paste (tex bs "oper{Diff}f"))
    (check (tree-has? d '(oper "Diff")) => #t))
  (with d (paste (tex bs "lga[b]{u" bs bs "v}"))
    (check (tree-has? d '(lga "b" (table (row (cell "u")) (row (cell "v"))))) => #t)
    (check (tree-has? d 'lga*) => #f)))

(define (test-copy)
  (with s (copy '(math "<bbb-R>+<cal-A>+<frak-g>+<cal*-L>+foo x"))
    (check (has? s (tex bs "R")) => #t)
    (check (has? s (tex bs "mc{A}")) => #t)
    (check (has? s (tex bs "mf{g}")) => #t)
    (check (has? s (tex bs "ms{L}")) => #t)
    (check (has? s (tex bs "oper{foo}")) => #t)
    (check (has? s (tex bs "mathcal")) => #f)
    (check (has? s (tex bs "mathbb")) => #f)
    (check (has? s (tex bs "tmop")) => #f)
    ;; a snippet has no preamble: nothing is defined there
    (check (has? s "NewDocumentCommand") => #f))
  (with s (copy '(math (lga "b" (table (row (cell "u")) (row (cell "v"))))))
    (check (has? s (tex bs "lga[b]{")) => #t))
  (with s (copy '(math (oper "Diff")))
    (check (has? s (tex bs "oper{Diff}")) => #t)))

(define (test-paste-then-copy)
  (with s (copy (cadr (paste (tex "$" bs "mathbb{R}+" bs "mathcal{A}+" bs "mathfrak{g}$"))))
    (check (has? s (tex bs "R")) => #t)
    (check (has? s (tex bs "mc{A}")) => #t)
    (check (has? s (tex bs "mf{g}")) => #t)))

(test-paste-symbols)
(test-paste-fonts)
(test-paste-oper-lga)
(test-copy)
(test-paste-then-copy)
(finish)
