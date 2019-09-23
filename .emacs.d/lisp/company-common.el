;; ~/.emacs.d/ide/company.el

(use-package company
  :ensure t
  :diminish
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-tooltip-limit 10)
  (setq company-idle-delay 0.1)
  (setq company-echo-delay 0)
  (setq company-minimum-prefix-length 3)
  (setq company-require-match nil)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  (define-key company-active-map [tab] 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
  (define-key company-active-map [backtab] 'company-complete-common-or-cycle)

  (use-package company-statistics
    :ensure t
    :config 
    (add-hook 'after-init-hook 'company-statistics-mode))

  (use-package company-dict
    :ensure t
    :init
    (add-to-list 'company-backends 'company-dict))

  ;; Until id-shell is written
  (use-package company-shell
    :ensure t
    :init
    (add-to-list 'company-backends 'company-shell))

  ;; Company-web and web-completion-data could be broken out,
  ;; but they show up in everything for now
  (use-package company-web
    :ensure t
    :init
    (add-to-list 'company-backends 'company-web-html))

  (use-package web-completion-data
    :ensure t
    :init
    (add-to-list 'company-backends 'web-completion-data)))

(provide 'company-common)
