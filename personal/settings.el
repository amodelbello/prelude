(require 'prelude-packages "~/.emacs.d/core/prelude-packages.el" t)

(prelude-require-package 'org-roam)

(defvar aw-dispatch-always nil)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(defvar org-log-done t)

(define-key org-mode-map (kbd "<M-s-up>") 'org-table-kill-row)
(define-key org-mode-map (kbd "<M-s-down>") 'org-table-insert-row)
(setq org-default-notes-file "~/pCloud Drive/org/notes.org")

; this works
(define-key org-mode-map (kbd "C-'") nil)

; but this doesn't work. how come?
(add-hook 'org-mode-hook
          (lambda () (define-key org-mode-map (kbd "C-'") nil)))

;; Org-Roam
;; (setq org-roam-directory (file-truename "~/pCloud Drive/org-roam"))
;; (setq org-roam-v2-ack t)
;; (org-roam-db-autosync-mode)

(prelude-require-package 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; General settings file
(global-set-key (kbd "\e\es")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/personal/settings.org")))

;; Additional packages
(global-set-key (kbd "\e\ep")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/personal/preload/config.el")))

(set-frame-font "DejaVu Sans Mono-10" nil t)
(setq-default line-spacing 0.4)
(setq-default fill-column 80)
(setq-default sentence-end-double-space nil)
(setq-default whitespace-line-column 110)

(setq-default global-tab-line-mode nil)
(setq-default tab-line-mode nil)
(setq-default tab-bar-mode nil)
(toggle-scroll-bar -1)

(setq-default visual-line-mode t)
    (desktop-save-mode 1)
    (setq-default org-catch-invisible-edits 'show)
    (setq-default prelude-whitespace nil)
;;    (save-interprogram-paste-before-kill t)
    (setq auto-mode-alist (append '(("\\.cl$" . lisp-mode))
                                  auto-mode-alist))

    (setq inferior-lisp-program "/usr/local/bin/sbcl")

    ;;keep cursor at same position when scrolling
    (setq scroll-preserve-screen-position 1)
    ;;scroll window up/down by one line
    (global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
    (global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))
    (global-set-key (kbd "C-M-q") 'query-replace)

    ;; Default kill ring behavior
    (define-key global-map (kbd "M-y") 'yank-pop)

    ;; Spell check
    (setq-default ispell-program-name "/usr/local/bin/aspell")

    ;; allow remembering risky variables
    (defun risky-local-variable-p (sym &optional _ignored) nil)

    ;; disable because we're using paredit
    (smartparens-mode -1)

    (tide-mode -1)
