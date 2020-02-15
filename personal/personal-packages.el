;; Themes
(prelude-require-package 'color-theme-sanityinc-tomorrow)

;; Python stuff

(prelude-require-package 'elpy)
(prelude-require-package 'lsp-python-ms)
;; (prelude-require-package 'flycheck-pyflakes)

;; Searching and editing
(prelude-require-package 'ag) ;; Silver search
(prelude-require-package 'multiple-cursors)

;; Org-mode things
(prelude-require-package 'htmlize)

;; Installing exec-from-shell to fix freaking PATH problems
(prelude-require-package 'exec-path-from-shell)

;; LSP stuff that I'm not really using right now.

;; (prelude-require-package 'lsp-mode)
;; (prelude-require-package 'lsp-ui)
;; (prelude-require-package 'company-lsp)
