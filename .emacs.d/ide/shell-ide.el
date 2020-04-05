;; ~/.emacs.d/ide/shell-ide.el

(use-package company-shell
  :ensure
  :init
  (add-to-list 'company-backends 'company-shell)
  :config
  (defun my-sh-mode-hook()
    (set (make-local-variable 'company-backends)
         '((company-shell company-files :with company-yasnippet)
           (company-dabbrev-code company-dabbrev))))

  (add-hook 'sh-mode-hook (lambda () (company-mode)
                            (my-sh-mode-hook))))

(add-to-list 'auto-mode-alist '("\\.bashrc\\'" . shell-script-mode))

(provide 'shell-ide)
