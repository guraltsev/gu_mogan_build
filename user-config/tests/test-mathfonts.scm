;; \mc \mb \mbf \mf \ms = \mathcal \mathbb \mathbf \mathfrak \mathscr
(load (string-append (getenv "UC_TESTS") "/helpers.scm"))

(define pairs
  '(("mc" "mathcal") ("mb" "mathbb") ("mbf" "mathbf") ("mf" "mathfrak") ("ms" "mathscr")))

(define (args cmd)
  (tex bs cmd "{A}+" bs cmd "{AB}+" bs cmd "{x}"))

;; the short form imports exactly like the long form
(define (test-import)
  (for-each
    (lambda (p)
      (check (normalize (import-math (args (car p))))
             => (normalize (import-math (args (cadr p))))))
    pairs))

(define (test-export-renames)
  (with e (export-math "<cal-A>+<bbb-R>+<frak-g>+<cal*-L>")
    (check (has? (body-of e) (tex bs "mc{A}")) => #t)
    (check (has? (body-of e) (tex bs "mf{g}")) => #t)
    (check (has? (body-of e) (tex bs "ms{L}")) => #t)
    (check (has? (body-of e) (tex bs "mathcal")) => #f)
    (check (has? (body-of e) (tex bs "mathfrak")) => #f)
    (check (has? (body-of e) (tex bs "mathscr")) => #f))
  (with e (export-math '(math-bf "x"))
    (check (has? (body-of e) (tex bs "mbf{x}")) => #t)
    (check (has? (body-of e) (tex bs "mathbf")) => #f))
  (with e (export-math '(with "math-font" "Bbb" "AB"))
    (check (has? (body-of e) (tex bs "mb{")) => #t)))

(define (test-export-macros)
  ;; Mogan's own macros (mathfonts.stem) export to the same commands
  (with e (export-math '(mc "K") "+" '(mb "N") "+" '(mbf "v") "+" '(mf "h") "+" '(ms "S"))
    (for-each
      (lambda (s) (check (has? (body-of e) (tex bs s)) => #t))
      '("mc{K}" "mb{N}" "mbf{v}" "mf{h}" "ms{S}"))))

(define (test-preamble)
  (with e (export-math "<cal-A>+<frak-g>")
    (check (has? (preamble-of e)
                 (tex bs "NewDocumentCommand{" bs "mc}{m}{" bs "mathcal{#1}}"))
           => #t)
    (check (has? (preamble-of e) (tex "% " bs "mc{...}: synonym of " bs "mathcal")) => #t)
    (check (has? (preamble-of e)
                 (tex bs "NewDocumentCommand{" bs "mf}{m}{" bs "mathfrak{#1}}"))
           => #t)
    (check (has? (preamble-of e) "amssymb") => #t)
    ;; unused ones are not defined
    (check (has? (preamble-of e) (tex "{" bs "mb}")) => #f)
    (check (has? (preamble-of e) (tex "{" bs "mbf}")) => #f)
    (check (has? (preamble-of e) (tex "{" bs "ms}")) => #f)
    (check (has? e (tex bs "newcommand")) => #f))
  (with e (export-math "<cal*-L>")
    (check (has? (preamble-of e) "mathrsfs") => #t)
    (check (has? (preamble-of e)
                 (tex bs "NewDocumentCommand{" bs "ms}{m}{" bs "mathscr{#1}}"))
           => #t)))

(define (test-unused)
  (with e (export-math "x+y")
    (check (has? e "NewDocumentCommand") => #f)
    (check (has? e "mathrsfs") => #f)))

(define (test-round-trip)
  (with e (export-doc (import-math (tex bs "mathcal{A}+" bs "mathfrak{g}")))
    (check (has? (body-of e) (tex bs "mc{A}")) => #t)
    (check (has? (body-of e) (tex bs "mf{g}")) => #t)))

(test-import)
(test-export-renames)
(test-export-macros)
(test-preamble)
(test-unused)
(test-round-trip)
(finish)
