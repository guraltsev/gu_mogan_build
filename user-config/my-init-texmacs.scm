;; Mogan user keyboard bindings.
;; user-kbd-map / user-kbd-unmap register into the user layer: they always win
;; over built-in bindings, however late those are loaded (see
;; gu_mogan_build/patches/03-user-kbd-map).  Keys are written as names
;; (alpha, varepsilon, A-x ...), which also works through the fallback below;
;; a literal "α" is accepted by the real macro and means the same as "alpha".

;; Compatibility: builds without the user keyboard layer (older Mogan / TeXmacs)
;; have no user-kbd-map.  Fall back to plain kbd-map / kbd-unmap, run after a delay
;; so that the lazily loaded built-in keyboard modules are already in place and
;; these bindings are registered last.  Use key NAMES (alpha, A-x ...) in files
;; that must work on such builds: literal Unicode keys need the real macro.
(if (not (defined? 'user-kbd-map))
    (begin
      (define-macro (user-kbd-map . l)
        `(delayed (:pause 3000)
           (if (defined? 'lazy-keyboard-force) (lazy-keyboard-force #t))
           (kbd-map ,@l)))
      (define-macro (user-kbd-unmap . l)
        `(delayed (:pause 3000)
           (if (defined? 'lazy-keyboard-force) (lazy-keyboard-force #t))
           (kbd-unmap ,@l)))))

(user-kbd-map ("A-x" (interactive exec-interactive-command)))
 
(user-kbd-unmap
        (:mode in-math?)
        "| `")


(user-kbd-map
        ("copyto l" (clipboard-copy-export "latex" "primary"))
        ("cutto l" (clipboard-cut-export "latex" "primary"))
        ("pastefrom l" (clipboard-paste-import "latex" "primary")))



(user-kbd-map
        (:mode in-math?)
        ("`" "" "")
        ("` ` `" "`")
        ("` <" (math-bracket-open "<langle>" "<rangle>" #f))
        ("` < <" (math-bracket-open "<llangle>" "<rrangle>" #f))
          
        ("C-/" (make-fraction))
        ("C-/ var" (make 'frac*))

        ("` ~" (make-wide "~"))
        ("` ^" (make-wide "^"))
        ("` @" (make-wide "<abovering>"))
        ("` -" (make-wide "<wide-bar>"))
        ("` - >" (make-wide "<vect>"))

        ("` *" "<times>")
        ("` * var" "<star>")

        ("$" (variant-circulate (focus-tree) #t))
        ("` $" (make 'text))

        ("` +" (math-big-operator "int"))
        ("` + var" (math-big-operator "iint"))
        ("` + var var" (math-big-operator "iiint"))
        ("` + var var var" (math-big-operator "oint"))
        ("` + o" (math-big-operator "oint"))
        ("` + +" (math-big-operator "sum"))

        ("` (" (make 'matrix))
        ("` ( var" (make 'bmatrix))
        ("` ( var var" (make 'tabular*))
        ("` ( var" (make 'bmatrix))

        ("` {" (make 'cases))
        ("` { var" (make 'choice))


        ("( math t" (make 'matrix))
        ("[ math t" (make 'bmatrix))
        ("{ math t" (make 'choice))
        ("math t" (make 'ltae))
        ("math t var" (make 'tabular*))
        ("math t var var" (make 'stack))
        ("math t var var var" (make 'choice))


        (":" ":")
        (": var" "<suchthat>")
        (": var var" "<of>")
        (": var var var" "<over>")
                
         
        ("alpha" "<alpha>")
        ("beta" "<beta>")
        ("delta" "<delta>")
        ("Delta" "<Delta>")
        ("varepsilon" "<varepsilon>")
        ("varepsilon var" "<epsilon>")
        ("varphi" "<varphi>")
        ("varphi var" "<phi>")
        ("Phi" "<Phi>")
        ("gamma" "<gamma>")
        ("Gamma" "<Gamma>")
        ("eta" "<eta>")
        ("theta" "<theta>")
        ("theta var" "<vartheta>")
        ("Theta" "<Theta>")
        ("kappa" "<kappa>")
        ("lambda" "<lambda>")
        ("Lambda" "<Lambda>")
        ("mu" "<mu>")
        ("nu" "<nu>")
        ("pi" "<pi>")
        ("Pi" "<Pi>")
        ("chi" "<chi>")
        ("Chi" "<Chi>")
        ("rho" "<rho>")
        ("sigma" "<sigma>")
        ("Sigma" "<Sigma>")
        ("Sigma var" "<sum>")
        ("tau" "<tau>")
        ("upsilon" "<upsilon>")
        ("Upsilon" "<Upsilon>")
        ("omega" "<omega>")
        ("Omega" "<Omega>")
        ("xi" "<xi>")
        ("Xi" "<Xi>")
        ("psi" "<psi>")
        ("psi var" "<psi>")
        ("Psi" "<Psi>")
        ("zeta" "<zeta>")
)
