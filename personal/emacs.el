;;; emacs.el --- My General config

;;; Commentary:
;; My Emacs configuration

;; Prelude stuff
(setq prelude-guru nil)


;; Please, show me my numbers
;; (global-display-line-numbers-mode)

;; Disable the ugly color change for line-tail of whitespace-style
(setq whitespace-style '(face tabs empty trailing))


;; Some truncate and long line preferences
(setq truncate-lines t)
(setq visual-line-mode t)

;; Speed up long lines
(setq bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

;; Keyboard and keybindings

;; Flycheck for PyFlakes

(flycheck-define-checker python-pyflakes
  "A Python syntax and style checker using the pyflakes utility.
To override the path to the pyflakes executable, set
`flycheck-python-pyflakes-executable'.
See URL `http://pypi.python.org/pypi/pyflakes'."
  :command ("pyflakes" source-inplace)
  :error-patterns
  ((error line-start (file-name) ":" line ":" (message) line-end))
  :modes python-mode)

(add-to-list 'flycheck-checkers 'python-pyflakes)

;; End flycheck

;; elpy stuff
(elpy-enable)

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (flycheck-add-mode 'python-pylint 'django-mode)
  (flycheck-add-mode 'python-flake8 'django-mode)
  (flycheck-add-mode 'python-pyflakes 'django-mode)
  )

;; (with-eval-after-load 'flycheck
;;   '(progn
;;      (flycheck-add-mode 'python-pylint 'django-mode)
;;      (flycheck-add-mode 'python-flake8 'django-mode)
;;      (flycheck-add-mode 'python-pyflakes 'django-mode)))

(setq elpy-rpc-timeout 10000) ;; Black can take some time to run
(setq elpy-remove-modeline-lighter t)

(advice-add 'elpy-modules-remove-modeline-lighter
            :around (lambda (fun &rest args)
                      (unless (eq (car args) 'flymake-mode)
                        (apply fun args))))

(add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook
                                      'elpy-black-fix-code nil t)))

;; Magit
(setq magit-diff-refine-hunk (quote all))

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; org-mode
(setq org-directory "~/org")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-src-preserve-indentation t)
(setq org-edit-src-content-indentation 0)
(setq org-startup-indented t)
(setq org-startup-truncated nil)

;;; emacs.el ends here
