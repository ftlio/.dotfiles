;; ~/.emacs.d/lisp/ide/go-ide.el

(setenv "GOPATH" "/Users/alen/gocode:/Users/alen/code/inspire-ems/api")
(setq exec-path (append exec-path '("/Users/alen/gocode/bin")))

(use-package go-eldoc
  :ensure t
  :defer t)

(use-package go-guru
  :ensure t
  :defer t
  :init
  (go-guru-hl-identifier-mode))

(use-package company-go
  :ensure t
  :defer t)

(use-package lsp-mode
  :ensure t
  :defer t)

(use-package go-mode
  :ensure t
  :defer t
  :init
  (setq tab-width 2 indent-tabs-mode 1)
  (add-hook 'go-mode-hook 'lsp-deferred)
  (add-hook 'go-mode-hook 'flycheck-mode)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (add-hook 'go-mode-hook
      (lambda ()
        (set (make-local-variable 'company-backends) '(company-go))
        (company-mode))))

(use-package go-projectile
  :ensure t
  :defer t)


(provide 'go-ide)
