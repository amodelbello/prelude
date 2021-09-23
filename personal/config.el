(require 'prelude-packages "~/.emacs.d/core/prelude-packages.el" t)

;; General Config
(setq-default line-spacing 0.2)
(setq-default fill-column 110)
(setq-default whitespace-line-column 110)
(setq-default visual-line-mode t)
(desktop-save-mode 1)
(setq-default org-catch-invisible-edits 'show)
(global-undo-tree-mode 0)

;;keep cursor at same position when scrolling
(setq scroll-preserve-screen-position 1)
;;scroll window up/down by one line
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

;; Default kill ring behavior
(define-key global-map (kbd "M-y") 'yank-pop)

;; Ace Window
(defvar aw-dispatch-always t)

;; Avy
(define-key global-map (kbd "C-\"") 'avy-goto-char-2)

;; Org Mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(defvar org-log-done t)

(define-key org-mode-map (kbd "<M-s-up>") 'org-table-kill-row)
(define-key org-mode-map (kbd "<M-s-down>") 'org-table-insert-row)

;; Multiple Cursors
(prelude-require-package 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; Org Bullets
(prelude-require-package 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
