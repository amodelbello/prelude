(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(use-package beacon
  :ensure t
  :config (beacon-mode 1))

(use-package format-all
  :ensure t
  :config (format-all-mode 1)
  :init
  (progn
    (add-hook 'prog-mode-hook 'format-all-mode)
    (add-hook 'format-all-mode-hook 'format-all-ensure-formatter)
    (add-hook 'before-save-hook 'format-all-buffer)))

(use-package paredit
  :ensure t
  :init
  (progn
    (add-hook 'lisp-mode-hook 'paredit-mode)
    (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
    (add-hook 'clojure-mode-hook 'paredit-mode)
    (add-hook 'clojurescript-mode-hook 'paredit-mode)
    (add-hook 'clojurec-mode-hook 'paredit-mode)
    (add-hook 'cider-repl-mode-hook 'paredit-mode)))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package buffer-move
  :ensure t
  :init
  (progn
    (global-set-key (kbd "<C-s-up>")     'buf-move-up)
    (global-set-key (kbd "<C-s-down>")   'buf-move-down)
    (global-set-key (kbd "<C-s-left>")   'buf-move-left)
    (global-set-key (kbd "<C-s-right>")  'buf-move-right)))
