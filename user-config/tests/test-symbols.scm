;; \R \C \Q \Z \N <-> <bbb-R> ... (typed RR CC QQ ZZ NN)
(load (string-append (getenv "UC_TESTS") "/helpers.scm"))

(define letters '("R" "C" "Q" "Z" "N"))

(define (test-import)
  (for-each
    (lambda (l)
      (let ((sym (tex "<bbb-" l ">")))
        (check (tree-has? (import-math (tex bs l)) sym) => #t)
        (check (tree-has? (import-math (tex bs "mathbb{" l "}")) sym) => #t)
        (check (tree-has? (import-math (tex bs "mathbb " l)) sym) => #t)))
    letters)
  ;; the importer would otherwise invent hidden macro assignments for \R
  (check (tree-has? (import-math (tex bs "R+" bs "N")) 'hide-preamble) => #f)
  (check (tree-has? (import-math (tex bs "R+" bs "N")) "assign") => #f))

(define (test-export)
  (with e (export-math "<bbb-R>+<bbb-N>")
    (check (has? (body-of e) (tex bs "R")) => #t)
    (check (has? (body-of e) (tex bs "N")) => #t)
    (check (has? (body-of e) (tex bs "mathbb")) => #f)
    (check (has? (preamble-of e)
                 (tex bs "NewDocumentCommand{" bs "R}{}{" bs "mathbb{R}}"))
           => #t)
    (check (has? (preamble-of e) (tex "% " bs "R: blackboard bold R (Mogan RR)")) => #t)
    (check (has? (preamble-of e) "amssymb") => #t)
    ;; only the used ones are defined
    (check (has? (preamble-of e) (tex "{" bs "C}")) => #f)
    (check (has? (preamble-of e) (tex "{" bs "Z}")) => #f)
    (check (has? e (tex bs "newcommand")) => #f)))

(define (test-all-letters)
  (for-each
    (lambda (l)
      (with e (export-math (tex "<bbb-" l ">"))
        (check (has? (preamble-of e)
                     (tex bs "NewDocumentCommand{" bs l "}{}{" bs "mathbb{" l "}}"))
               => #t)))
    letters))

(define (test-unused)
  (with e (export-math "x+y")
    (check (has? e "NewDocumentCommand") => #f)
    (check (has? e "amssymb") => #f)))

(define (test-round-trip)
  (with e (export-doc (import-math (tex bs "mathbb{R}+" bs "Q")))
    (check (has? (body-of e) (tex bs "R")) => #t)
    (check (has? (body-of e) (tex bs "Q")) => #t)))

;; \1: double-struck one, defined with \mathbbm (package bbm)
(define (test-one)
  (for-each
    (lambda (src) (check (tree-mentions? (import-math src) "<bbb-1>") => #t))
    (list (tex bs "1") (tex bs "mathbbm{1}") (tex bs "mathbb{1}")))
  (check (tree-has? (import-math (tex bs "mathds{1}")) "<bbb-1>") => #f) ; other font: untouched
  (with e (export-math "<bbb-1>+x")
    (check (has? (body-of e) (tex bs "1")) => #t)
    (check (has? (body-of e) (tex bs "mathbbm")) => #f)
    (check (has? (preamble-of e) (tex bs "NewDocumentCommand{" bs "1}{}{" bs "mathbbm{1}}"))
           => #t)
    (check (has? (preamble-of e) (tex "% " bs "1: blackboard bold 1 (Mogan 1 1 var var var)"))
           => #t)
    (check (has? (preamble-of e) "bbm") => #t)
    (check (has? e (tex bs "newcommand")) => #f))
  ;; \1 is not defined unless used
  (check (has? (export-math "<bbb-R>") (tex "{" bs "1}")) => #f)
  (with e (export-doc (import-math (tex bs "mathbbm{1}_A")))
    (check (has? (body-of e) (tex bs "1")) => #t)))

(test-import)
(test-export)
(test-one)
(test-all-letters)
(test-unused)
(test-round-trip)
(finish)
