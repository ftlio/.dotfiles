;; ~/.emacs.d/lisp/ide/yas-common.el

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (define-key yas-minor-mode-map (kbd "C-c C-y") yas-maybe-expand))

(use-package yasnippet-snippets
  :ensure t)

(provide 'yas-common)
