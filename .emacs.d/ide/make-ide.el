;; ~/.emacs.d/ide/make-ide.el

;; Set Make hook
(add-hook 'LaTeX-mode-hook
      (lambda ()
        (setq tab-width 4)))

(provide 'make-ide)
