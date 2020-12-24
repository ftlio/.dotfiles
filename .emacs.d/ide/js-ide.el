;; ~/.emacs.d/ide/js-ide.el

;; Add Node to Path
(setq exec-path (append exec-path '("~/.nvm/versions/node/v12.16.1/bin")))

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
  (setq js2-basic-offset 2)
  (setq js2-include-node-externs t))

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
			   "--tab-width" "2"
			   "--trailing-comma" "all"
			   "--single-quote"
               "--no-semi"
			   "--cursor-offset"
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
	      (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))


(provide 'js-ide)
