;; ~/.emacs.d/lisp/flycheck-common.el

(use-package pos-tip
  :ensure t
  :defer t
  :diminish)

(use-package flycheck
  :ensure t
  :defer t
  :config
  (use-package flycheck-pos-tip :ensure)
  (flycheck-pos-tip-mode))

(defun my-eldoc-display-message (format-string &rest args)
  "Display eldoc message near point."
  (when format-string
    (pos-tip-show (apply 'format format-string args))))
(setq eldoc-message-function #'my-eldoc-display-message)

(provide 'flycheck-common)
