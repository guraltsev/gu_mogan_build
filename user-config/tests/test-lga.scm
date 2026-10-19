;; lga: \lga[t|c|b]{rows} <-> (lga "t|c|b" (table ...))
(load (string-append (getenv "UC_TESTS") "/helpers.scm"))

(define (test-import)
  (with d (import-math (tex bs "lga[b]{x" bs bs "z}"))
    (check (tree-has? d '(lga "b" (table (row (cell "x")) (row (cell "z"))))) => #t)
    (check (tree-has? d "lga") => #t)) ; style package added
  (with d (import-math (tex bs "lga{p" bs bs "q}"))
    (check (tree-has? d '(lga "t" (table (row (cell "p")) (row (cell "q"))))) => #t)))

(define (test-export)
  (let* ((rows '(table (row (cell "x")) (row (cell "z"))))
         (e (export-math `(lga "b" ,rows)))
         (d (export-math `(lga "t" ,rows))))
    (check (has? (body-of e) (tex bs "lga[b]{")) => #t)
    (check (has? (body-of d) (tex bs "lga{")) => #t)        ; default option omitted
    (check (has? (body-of d) (tex bs "lga[")) => #f)
    (check (has? (preamble-of e)
                 (tex bs "NewDocumentCommand{" bs "lga}{O{t} m}"))
           => #t)
    (check (has? (preamble-of e) "mathtools") => #t)
    (check (has? (preamble-of e) (tex "% " bs "lga[t|c|b]{...}")) => #t) ; comment
    (check (has? e (tex bs "newcommand")) => #f)
    (check (has? e (tex bs "providecommand")) => #f)))

(define (test-unused)
  (with e (export-math "x+y")
    (check (has? e "lga") => #f)
    (check (has? e "mathtools") => #f)))

(define (test-round-trip)
  (with d (import-math (tex bs "lga[c]{a" bs bs "b}"))
    (with e (export-doc d)
      (check (has? (body-of e) (tex bs "lga[c]{")) => #t))))

(test-import)
(test-export)
(test-unused)
(test-round-trip)
(finish)
