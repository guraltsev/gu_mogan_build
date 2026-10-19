;; \oper[*]{name}: synonym of \operatorname; Mogan's \tmop output is renamed to it
(load (string-append (getenv "UC_TESTS") "/helpers.scm"))

(define (test-import)
  (with d (import-math (tex bs "oper{D}f"))
    (check (tree-has? d '(oper "D")) => #t)
    (check (tree-has? d "oper") => #t)) ; style package added
  (with d (import-math (tex bs "oper{Diff}f"))
    (check (tree-has? d '(oper "Diff")) => #t)
    ;; a separate node: a bare string would merge with the next letter ("Difff")
    (check (tree-has? d "Difff") => #f)
    (check (tree-has? d "f") => #t)))

(define (test-export-macro)
  (with e (export-math '(oper "Diff") "+" '(oper "D"))
    (check (has? (body-of e) (tex bs "oper{Diff}")) => #t)
    (check (has? (body-of e) (tex bs "oper{D}")) => #t)
    (check (has? (body-of e) (tex bs "oper{" bs "oper")) => #f)))

(define (test-export-tmop)
  ;; a multi-letter word that LaTeX does not know is written \tmop by Mogan
  (with e (export-math "foo x")
    (check (has? (body-of e) (tex bs "oper{foo}")) => #t)
    (check (has? e (tex bs "tmop")) => #f)))

(define (test-preamble)
  (with e (export-math '(oper "Diff"))
    (check (has? (preamble-of e)
                 (tex bs "NewDocumentCommand{" bs "oper}{s m}"))
           => #t)
    (check (has? (preamble-of e) (tex bs "operatorname*")) => #t)
    (check (has? (preamble-of e) (tex "% " bs "oper[*]{...}: synonym of " bs "operatorname"))
           => #t)
    (check (has? (preamble-of e) "amsmath") => #t)
    (check (has? e (tex bs "newcommand")) => #f)
    (check (has? e (tex "{" bs "op}")) => #f)))

(define (test-unused)
  (with e (export-math "sin x+x")
    (check (has? e "oper") => #f)))

(test-import)
(test-export-macro)
(test-export-tmop)
(test-preamble)
(test-unused)
(finish)
