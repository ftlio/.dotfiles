;; ~/.emacs.d/lisp/my-vc.el
(use-package magit
  :ensure t
  :defer t
  :init)

(global-set-key (kbd "C-x g") 'magit-status)

(provide 'my-vc)
