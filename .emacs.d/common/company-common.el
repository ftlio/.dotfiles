;; ~/.emacs.d/common/company-common.el

;; original config from:
;; https://github.com/CSRaghunandan/.emacs.d/blob/master/setup-files/setup-company.el

;; company: auto-completion backend for emacs
;; http://company-mode.github.io/
(use-package company
  :bind
  ;; replace `dabbrev-expand' with `hippie-expand'
  (("M-/" . hippie-expand)
   ("C-<tab>" . company-dabbrev))
  (:map company-active-map
        ("M-p" . nil)
        ("M-n" . nil)
        ("C-m" . nil)
        ("C-h" . nil)
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("<tab>" . company-complete-common-or-cycle)
        ("C-f" . company-complete-common)
        ("C-t" . company-show-doc-buffer))
  :init
  ;; Global for now
  ;; TODO - More granular company backend loading
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-tooltip-limit 10)
  (setq company-tooltip-flip-when-above t)
  (setq company-minimum-prefix-length 3)
  (setq company-idle-delay 0.2)
  (setq company-echo-delay 0)
  (setq company-selection-wrap-around t)
  (setq company-show-numbers t)
  (setq company-require-match 'never)
  (setq company-tooltip-align-annotations t)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-other-buffers t)

  ;; Suspend page-break-lines-mode while company menu is active
  ;; (see https://github.com/company-mode/company-mode/issues/416)
  (defvar sanityinc/page-break-lines-on-p nil)
  (make-variable-buffer-local 'sanityinc/page-break-lines-on-p)

  (defun sanityinc/page-break-lines-disable (&rest ignore)
    (when
        (setq sanityinc/page-break-lines-on-p
              (bound-and-true-p page-break-lines-mode))
      (page-break-lines-mode -1)))

  (defun sanityinc/page-break-lines-maybe-reenable (&rest ignore)
    (when sanityinc/page-break-lines-on-p
      (page-break-lines-mode 1)))

  (add-hook 'company-completion-started-hook 'sanityinc/page-break-lines-disable)
  (add-hook 'company-after-completion-hook 'sanityinc/page-break-lines-maybe-reenable)

  ;; Company-web and web-completion-data could be broken out,
  ;; but they show up in everything for now
  ;; company-web: company backend for html, jade, slim
  ;; https://github.com/osv/company-web
  (use-package company-web
    :init
    (add-to-list 'company-backends 'company-web-html))

  ;; web-completion-data: Shared web completion data for Emacs ac-html and company-web
  ;; https://github.com/osv/web-completion-data
  (use-package web-completion-data
    :init
    (add-to-list 'company-backends 'web-completion-data)))

;; company-prescient: Simple but effective sorting and filtering for Emacs.
;; https://github.com/raxod502/prescient.el/tree/master
(use-package company-prescient
  :hook (company-mode . company-prescient-mode)
  :config (prescient-persist-mode +1))

;; company-statistics: Sort completion candidates by previous completion choices
;; https://github.com/company-mode/company-statistics
(use-package company-statistics
  :ensure t
  :config
  (add-hook 'after-init-hook 'company-statistics-mode))

;; company-quickhelp: documentation popup for company
;; https://github.com/expez/company-quickhelp/tree/master
(use-package company-quickhelp
  :after company
  :config
  (when (is-linux-p)
    (company-quickhelp-mode)))

(provide 'company-common)

;;; company-mode
;; `C-TAB' to complete using company-dabbrev backend
;; `C-t' to view the documentation of the current completion candidate
;; `C-w' to jump to the source code of the completion candidate (does not work
;; with all major-modes)
;; `M-/' to execute `hippie-expand'
;; Press any non matching character to quit company
