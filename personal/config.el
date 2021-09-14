(require 'prelude-packages "~/.emacs.d/core/prelude-packages.el" t)

;; General Config
(set-face-attribute 'default nil :height 140)
(setq-default line-spacing 0.2)
(setq-default fill-column 90)
(setq-default visual-line-mode t)
(desktop-save-mode 1)

;; Ace Window
(defvar aw-dispatch-always t)

;; Org Mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(defvar org-log-done t)

;; Multiple Cursors
(prelude-require-package 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
