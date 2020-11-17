;;; custom-config --- My own preloaded config

;;; Commentary:

;;; Some config for preloading my Emacs

;;; Code:

;;; Unfortunately for some reason I was getting a cryptic error when downloading
;;; packages.  It was a TLS verification problem with Mac OS X and GnuTLS or WHATEVER.
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;; Please use the right Alt as AltGr so I can write Spanish stuff.
(when (eq system-type 'darwin)
  (setq mac-right-option-modifier 'none))

;; Let's set that beautiful theme

(setq prelude-theme 'sanityinc-tomorrow-night)
;;(setq prelude-theme 'sanityinc-tomorrow-day)

(set-face-attribute 'default nil :height 130)

;;; Freaking disable global-nlinum-mode
(setq prelude-minimalistic-ui t)
;; (global-nlinum-mode -1)
(global-display-line-numbers-mode 1)
