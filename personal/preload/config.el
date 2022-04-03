(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

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
    (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
    (add-hook 'clojure-mode-hook 'paredit-mode)
    (add-hook 'clojurescript-mode-hook 'paredit-mode)
    (add-hook 'clojurec-mode-hook 'paredit-mode)
    (add-hook 'cider-repl-mode-hook 'paredit-mode)))
