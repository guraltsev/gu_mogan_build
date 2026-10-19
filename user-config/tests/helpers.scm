;; Shared helpers for the user-config tests. Loaded by each test-*.scm; the
;; runner (run-tests.ps1) sets UC_TESTS to this folder.
;; The tests exercise the INSTALLED config (%APPDATA%\moganlab), see README.md.

(import (liii check))
(check-set-mode! 'report-failed)

(plugin-initialize 'latex)
(import-from (latex latex-format))

(define bs (string (integer->char 92)))

(define (tex . parts) (apply string-append parts))

;; ---- import: LaTeX source -> stree --------------------------------------

(define (import-doc body)
  (tree->stree
    (convert (tex bs "documentclass{article}" bs "begin{document}" body
                  bs "end{document}")
             "latex-document" "texmacs-tree")))

(define (import-math body) (import-doc (tex "$" body "$")))

;; Adjacent strings in a concat are equivalent ("a" "+" == "a+"), so merge them
;; before comparing two imports.
(define (merge-strings l)
  (let loop ((l l) (acc '()))
    (cond ((null? l) (reverse acc))
          ((and (string? (car l)) (pair? acc) (string? (car acc)))
           (loop (cdr l) (cons (string-append (car acc) (car l)) (cdr acc))))
          (else (loop (cdr l) (cons (car l) acc))))))

(define (normalize t)
  (cond ((and (pair? t) (eq? (car t) 'concat))
         `(concat ,@(merge-strings (map normalize (cdr t)))))
        ((pair? t) (map normalize t))
        (else t)))

(define (tree-has? t x)
  (cond ((equal? t x) #t)
        ((pair? t) (or (tree-has? (car t) x) (tree-has? (cdr t) x)))
        (else #f)))

;; True if some string leaf of t contains s (neighbouring symbols merge into one string).
(define (tree-mentions? t s)
  (cond ((string? t) (string-contains? t s))
        ((pair? t) (or (tree-mentions? (car t) s) (tree-mentions? (cdr t) s)))
        (else #f)))

;; ---- export: stree -> LaTeX text ----------------------------------------

(define (math-doc style . body)
  `(document (TeXmacs "2.1.4") (style (tuple "article" ,@style))
     (body (document (math ,@body)))))

;; The option list of Mogan's texmacs-stree -> latex-document converter (as -c and
;; the GUI use it). The options matter: with use-macros off, macros such as tmop
;; are expanded inline instead of being defined in the preamble.
(define export-options
  '(("texmacs->latex:source-tracking" . "off")
    ("texmacs->latex:conservative" . "on")
    ("texmacs->latex:transparent-source-tracking" . "on")
    ("texmacs->latex:attach-tracking-info" . "on")
    ("texmacs->latex:replace-style" . "on")
    ("texmacs->latex:expand-macros" . "on")
    ("texmacs->latex:expand-user-macros" . "off")
    ("texmacs->latex:indirect-bib" . "off")
    ("texmacs->latex:use-macros" . "on")
    ("texmacs->latex:protect-nested-bars" . "on")
    ("texmacs->latex:encoding" . "UTF-8")))

(define (export-doc st)
  (serialize-latex (texmacs->latex (stree->tree st) export-options)))

(define (export-math . body) (export-doc (apply math-doc '() body)))

;; The part of the exported file before / after \begin{document}.
(define (split-at-document s)
  (let* ((key (tex bs "begin{document}"))
         (n (string-length key)))
    (let loop ((i 0))
      (cond ((> (+ i n) (string-length s)) (cons s ""))
            ((== (substring s i (+ i n)) key)
             (cons (substring s 0 i) (substring s (+ i n) (string-length s))))
            (else (loop (+ i 1)))))))

(define (preamble-of s) (car (split-at-document s)))
(define (body-of s) (cdr (split-at-document s)))

(define (has? s sub) (string-contains? s sub))

(define (finish)
  (check-report)
  (quit-TeXmacs))
