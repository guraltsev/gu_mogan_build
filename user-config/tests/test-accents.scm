;; \tilde \hat \bar are redefined in the preamble (only if used) to the wide versions
(load (string-append (getenv "UC_TESTS") "/helpers.scm"))

(define cases
  ;; wide accent in Mogan, LaTeX command, wide replacement
  '(("~" "tilde" "widetilde") ("^" "hat" "widehat") ("<bar>" "bar" "overline")))

(define (renew cmd wide)
  (tex bs "RenewDocumentCommand{" bs cmd "}{m}{" bs wide "{#1}}"))

(define (test-redefined)
  (for-each
    (lambda (c)
      (with e (export-math `(wide "x" ,(car c)))
        (check (has? (body-of e) (tex bs (cadr c) "{x}")) => #t)
        (check (has? (preamble-of e) (renew (cadr c) (caddr c))) => #t)
        (check (has? (preamble-of e)
                     (tex "% " bs (cadr c) ": redefined as " bs (caddr c)))
               => #t)
        (check (has? e (tex bs "renewcommand")) => #f)))
    cases))

;; only the accents that occur are redefined
(define (test-only-used)
  (with e (export-math '(wide "x" "~"))
    (check (has? (preamble-of e) (renew "hat" "widehat")) => #f)
    (check (has? (preamble-of e) (renew "bar" "overline")) => #f))
  (with e (export-math '(concat (wide "x" "~") "+" (wide "y" "^")))
    (check (has? (preamble-of e) (renew "tilde" "widetilde")) => #t)
    (check (has? (preamble-of e) (renew "hat" "widehat")) => #t)
    (check (has? (preamble-of e) (renew "bar" "overline")) => #f)))

(define (test-others-untouched)
  ;; \check and \overline are not redefined, and nothing is added without accents
  (with e (export-math '(wide "x" "<check>"))
    (check (has? e "RenewDocumentCommand") => #f))
  (with e (export-math '(wide "x" "<wide-bar>"))
    (check (has? (body-of e) (tex bs "overline{x}")) => #t)
    (check (has? e "RenewDocumentCommand") => #f))
  (with e (export-math "x+y")
    (check (has? e "RenewDocumentCommand") => #f)))

;; Mogan already picks the wide command for a longer argument
(define (test-multi-letter)
  (with e (export-math '(wide (concat "x" " " "y") "^"))
    (check (has? (body-of e) (tex bs "widehat{")) => #t)
    (check (has? (preamble-of e) (renew "hat" "widehat")) => #f)))

(test-redefined)
(test-only-used)
(test-others-untouched)
(test-multi-letter)
(finish)
