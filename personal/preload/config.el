(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(use-package beacon
             :ensure t
             :config
             (beacon-mode 1))
