;; ~/.emacs.d/ide/docker-ide.el

(use-package dockerfile-mode
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(provide 'docker-ide)
