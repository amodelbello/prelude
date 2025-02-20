(require 'prelude-packages "~/.emacs.d/core/prelude-packages.el" t)

(defvar aw-dispatch-always nil)

(custom-set-variables
 '(company-quick-access-keys '("a" "o" "e" "u" "i"))
 '(company-quick-access-modifier 'super)
 '(setq company-tooltip-flip-when-above nil))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(defvar org-log-done t)

(define-key org-mode-map (kbd "<M-s-up>") 'org-table-kill-row)
(define-key org-mode-map (kbd "<M-s-down>") 'org-table-insert-row)
(setq org-default-notes-file "~/pCloud Drive/org/notes.org")

(define-key org-mode-map (kbd "C-'") nil)
(setq org-startup-folded t)
(setq org-hide-leading-stars t)

;; (prelude-require-package 'org-roam)
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

(set-frame-font "DejaVu Sans Mono-14" nil t)
(setq-default line-spacing 0.3)
(setq-default fill-column 80)
(setq-default sentence-end-double-space nil)
(setq-default whitespace-line-column 110)

;; Because the line-spacing above messes up calc
(add-hook 'calc-mode-hook
          (lambda ()
            (setq line-spacing 0)))
(add-hook 'calc-trail-mode-hook
          (lambda ()
            (setq line-spacing 0)))

(setq-default global-tab-line-mode nil)
(setq-default tab-line-mode nil)
(setq-default tab-bar-mode nil)
(toggle-scroll-bar -1)

; easily shrink window vertically
(global-set-key (kbd "C-x %") (kbd "C-u -1 C-x ^"))

(setq ibuffer-saved-filter-groups
           (quote (("default"
                    ("org" (mode . org-mode))
                    ("IRC" (or (mode . circe-channel-mode) (mode . circe-server-mode)))
                    ("web" (or (mode . web-mode) (mode . js2-mode)))
                    ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
                    ("mu4e" (or
                             (mode . mu4e-compose-mode)
                             (name . "\*mu4e\*")
                             ))
                    ("programming" (or
                                    (mode . emacs-lisp-mode)
                                    (mode . lisp-mode)
                                    (mode . clojure-mode)
                                    (mode . clojurescript-mode)
                                    (mode . python-mode)
                                    (mode . c-mode)
                                    (mode . c++-mode)))
                    ("text" (mode . text-mode))
                    ("magit" (mode . magit-mode))
                    ("dired" (mode . dired-mode))
                    ("emacs" (or
                              (name . "^\\*scratch\\*$")
                              (name . "^\\*Messages\\*$")))
                    ))))
     (add-hook 'ibuffer-mode-hook
               (lambda ()
                 (ibuffer-auto-mode 1)
                 (ibuffer-switch-to-saved-filter-groups "default")))

     ;; Don't show filter groups if there are no buffers in that group
     (setq ibuffer-show-empty-filter-groups nil)

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

;; disable super-save
(super-save-mode -1)
