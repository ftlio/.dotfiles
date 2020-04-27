;; ~/.emacs.d/ide/ruby-ide.el

(use-package robe
  :ensure t
  :defer t
  :init
  (add-hook 'ruby-mode-hook 'robe-mode)
  (eval-after-load 'company
    '(push 'company-robe company-backends))
  )

(provide 'ruby-ide)
