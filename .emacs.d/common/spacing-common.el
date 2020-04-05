;; ~/.emacs.d/common/spacing-common.el

;; Show actual lines instead of the page break char ^L
;; https://github.com/purcell/page-break-lines
;; enter page-break character in Emacs by entering `C-q C-l'
(use-package page-break-lines
  :ensure
  :hook ((prog-mode org-mode) . page-break-lines-mode)
  :config (setq page-break-lines-max-width 80))

;; highlight fill column for emacs.
;; https://github.com/laishulu/hl-fill-column/
(use-package hl-fill-column
  :ensure
  :hook ((text-mode prog-mode conf-mode) . hl-fill-column-mode))

;; Pop a posframe (just a child-frame) at point
;; https://github.com/tumashu/posframe
(use-package posframe :ensure)

(provide 'spacing-common)
