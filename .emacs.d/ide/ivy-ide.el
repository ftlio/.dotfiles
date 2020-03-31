;; ~/.emacs.d/ide/ivy-ide.el

(use-package ivy
  :ensure t
  :defer t
  :bind (("C-c C-r" . ivy-resume))
  :init
  (setq ivy-initial-inputs-alist nil)
  :config
  (use-package ivy-hydra :defer :diminish)
  (use-package flx :defer :diminish)
  (setq ivy-use-selectable-prompt t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-re-builders-alist
      '((swiper . regexp-quote)
        (t      . ivy--regex-fuzzy)))
  (ivy-mode 1)
  :diminish)

(use-package swiper
  :ensure t
  :defer t
  :bind (("C-s" . counsel-grep-or-swiper))
  :diminish)

(use-package counsel
  :ensure t
  :defer t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x 4 f" . counsel-describe-function)
         ("C-x 4 v" . counsel-describe-variable)
         ("C-x 4 l" . counsel-find-library)
         ("C-x 4 s" . counsel-info-lookup-symbol)
         ("C-x 4 u" . counsel-unicode-char)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-git-grep)
         ("C-c k" . counsel-rg)
         ("C-x l" . counsel-locate)
         :map minibuffer-local-map
         ("C-r" . counsel-minibuffer-history))
  :config
  (setq counsel-rg-base-command "rg -M 120 \
                                 --line-number \
                                 --smart-case \
                                 --with-filename \
                                 --color never \
                                 --follow \
                                 --no-heading %s")
  (setq ivy-sort-matches-functions-alist '((t . nil)
                                           (ivy-switch-buffer . ivy-sort-function-buffer)
                                           (counsel-find-file . ivy-sort-function-buffer)))
  :diminish)

(use-package projectile
  :ensure t
  :defer t
  :diminish t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (use-package counsel-projectile :defer :diminish)
  :init
  (setq projectile-completion-system 'ivy))


(provide 'ivy-ide)
