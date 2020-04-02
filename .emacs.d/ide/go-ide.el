;; ~/.emacs.d/ide/go-ide.el

(setq exec-path (append exec-path '("/Users/alen/gocode/bin")))

(use-package go-mode
  :defer t
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :init
  (setq tab-width 2 indent-tabs-mode 1)
  (setq compile-command "echo Building... && \
                        go build -v && \
                        echo Testing... && \
                        go test -v && \
                        echo Linter... && \
                        golint")
  (setq compilation-read-command nil)
  :bind (("M-," . compile)
         ("M-." . godef-jump)))

(use-package go-projectile
   :ensure t
   :defer t)

(setq compilation-window-height 14)
(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
	(let* ((w (split-window-vertically))
	       (h (window-height w)))
	  (select-window w)
	  (switch-to-buffer "*compilation*")
	  (shrink-window (- h compilation-window-height)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)

(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
(setq compilation-scroll-output t)

(provide 'go-ide)
