;; ~/.emacs.d/ide/whitespace-ide.el

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'whitespace-ide)
