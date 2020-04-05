;; ~/.emacs.d/common/lsp-common.el

;; TODO Docs

(use-package lsp-mode
  :ensure t
  :bind
  (:map lsp-mode-map
        ("C-c C-t" . lsp-describe-thing-at-point))
  :hook (go-mode . lsp-deferred)
  :config
  (setq lsp-prefer-flymake nil)
  (setq lsp-keep-workspace-alive nil))

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil
        lsp-ui-flycheck-enable t
        lsp-ui-imenu-enable t
        lsp-ui-sideline-ignore-duplicate t))

(use-package company-lsp
  :ensure t
  :config (push 'company-lsp company-backends))

;; debugger adapter protocol support for emacs
;; https://github.com/emacs-lsp/dap-mode/
(use-package dap-mode
  :defer 4
  :config
  ;; call dap-hydra when going to the next breakpoint
  (add-hook 'dap-stopped-hook
            (lambda (arg) (call-interactively #'dap-hydra)))
  (add-hook 'dap-mode-hook #'dap-ui-mode) ; use a hook so users can remove it
  (dap-mode 1))

(provide 'lsp-common)
