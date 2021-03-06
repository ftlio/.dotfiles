;; ~/.emacs.d/ide/treemacs-ide.el

;; original config at:
;; https://github.com/CSRaghunandan/.emacs.d/blob/master/setup-files/setup-treemacs.el

;; treemacs: a tree layout file explorer for Emacs
;; https://github.com/Alexander-Miller/treemacst
(use-package treemacs
  :hook
  ;; slightly lower the size of treemacs window
  ((treemacs-mode . (lambda ()
                      (setq buffer-face-mode-face '(:height .88))
                      (buffer-face-mode))))
  :config
  (progn
    (setq treemacs-follow-after-init t
          treemacs-recenter-after-file-follow t
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-eldoc-display nil
          treemacs-collapse-dirs (if (executable-find "python") 3 0)
          treemacs-silent-refresh t
          treemacs-silent-filewatch t
          treemacs-change-root-without-asking t
          treemacs-sorting 'alphabetic-asc
          treemacs-show-hidden-files t
          treemacs-never-persist nil
          treemacs-is-never-other-window t)

    ;; set the correct python3 executable path. This is needed for
    ;; treemacs-git-mode extended
    (setq treemacs-python-executable (executable-find "python"))

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)

    ;; no longer needed since fringe is hidden in doom-themes-treemacs-theme
    (treemacs-fringe-indicator-mode nil)

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))

  :bind
  (:map global-map
        ("C-c f" . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)))

(use-package treemacs-projectile
  :after treemacs projectile
  :bind (:map global-map
              ("C-c o t" . treemacs-projectile)))

(use-package treemacs-magit
  :after treemacs magit)

;; Integration between lsp-mode and treemacs and implementation of treeview
;; controls using treemacs as a tree renderer.
;; https://github.com/emacs-lsp/lsp-treemacs
(use-package lsp-treemacs :defer 5
  :config
  (lsp-treemacs-sync-mode 1))

(provide 'treemacs-ide)
