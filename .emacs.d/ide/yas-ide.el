;; ~/.emacs.d/ide/yas-ide.el

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (define-key yas-minor-mode-map (kbd "C-c C-y") yas-maybe-expand))

(use-package yasnippet-snippets
  :ensure t
  :defer t)

(yas-global-mode 1)

(provide 'yas-ide)
