;; ~/.emacs.d/common/avy-common.el

;; original config from:
;; https://github.com/CSRaghunandan/.emacs.d/blob/master/setup-files/setup-avy.el

;; avy: package for jumping to visible text using character based decision tree
;; https://github.com/abo-abo/avy
(use-package avy
  :ensure
  :bind
  (("C-'" . avy-goto-char-timer)
   ("M-g M-g" . avy-goto-line))
  :bind*
  ("C-," . avy-goto-word-1)
  :config
  (setq avy-style 'pre)
  (setq avy-background t
        ;; Don't jump on single candidate (erratic)
        avy-single-candidate-jump nil
        avy-all-windows nil
        avy-all-windows-alt t)
  (setq avy-indent-line-overlay t))

(provide 'avy-common)
