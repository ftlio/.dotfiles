;; ~/.emacs.d/lisp/ide/js-ide.el

(use-package company-tern
  :ensure t
  :defer t
  :init
  (add-to-list 'company-backends 'company-tern))

(use-package tern
  :ensure t
  :defer t)

(use-package js2-mode 
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
  :config
  (unbind-key "M-." js-mode-map)

  (use-package js2-highlight-vars
    :ensure t)

  (use-package prettier-js
    :ensure t
    :diminish
    :bind (:map js2-mode-map
                ("C-x p" . 'pretter-js))
    :init
    (add-hook 'js2-mode-hook 'prettier-js-mode)
    (add-hook 'js2-mode-hook 'tern-mode)
    (setq prettier-js-args '(
                             "--print-width" "80"
                             "--tab-width" "4"
                             "--trailing-comma" "none"
                             "--single-quote"
                             "--cursorOffset"
                             )))
    
  (use-package js2-refactor
    :ensure t
    :defer t
    :diminish
    :bind (:map js2-mode-map
                ("C-k" . js2r-kill))
    :init
    (add-hook 'js2-mode-hook 'js2-refactor-mode)
    (js2r-add-keybindings-with-prefix "C-x C-r"))

  (use-package xref-js2
    :ensure t
    :defer t
    :diminish
    :config
    (add-hook 'js2-mode-hook
              (lambda ()
                (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))))


(provide 'js-ide)
