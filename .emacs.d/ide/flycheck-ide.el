;; ~/.emacs.d/ide/flycheck-ide.el

(use-package flycheck
  :ensure t
  :defer t
  :config
  (flycheck-pos-tip-mode))

(provide 'flycheck-ide)
