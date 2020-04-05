;; ~/.emacs.d/common/counsel-common.el

;; original config at:
;; https://github.com/CSRaghunandan/.emacs.d/blob/master/setup-files/setup-counsel.el

;; counsel: ivy backends for a lot more commands
;; https://github.com/abo-abo/swiper
(use-package ivy
  :diminish
  :init
  (ivy-mode))

(use-package counsel
  :diminish
  :init
  (counsel-mode)
  :bind
  (("M-x" . counsel-M-x)
   ("C-r" . counsel-minibuffer-history)
   ("C-c m u" . counsel-imenu)
   ("C-x C-f" . counsel-find-file)
   ("C-x d" . counsel-dired)
   ("C-c g g" . counsel-git)
   ("C-c g j" . counsel-git-grep)
   ("C-c k" . counsel-rg)

   :map read-expression-map
   ("C-r" . counsel-expression-history)

   :map counsel-find-file-map
   ("<left>" . counsel-up-directory)
   ("<right>" . counsel-down-directory))
  :config
  (setq ivy-use-selectable-prompt t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq counsel-find-file-at-point t)

  ;; ripgrep config
  (if (executable-find "rg")
      ;; if rg is installed, use rg for `counsel-grep-or-swiper' and `counsel-rg'
      (setq counsel-grep-base-command "rg -M 120 \
                                          --line-number \
                                          --smart-case \
                                          --with-filename \
                                          --color never \
                                          --no-heading %s %s"
    ;; add `--follow' option to allow search through symbolic links
            counsel-rg-base-command "rg -M 120 \
                                        --line-number \
                                        --smart-case \
                                        --with-filename \
                                        --color never \
                                        --follow \
                                        --no-heading %s"
     ;; Use ripgrep for counsel-git
            counsel-git-cmd "rg --files"
     ;; ignore case sensitivity for counsel grep
            counsel-grep-base-command "grep -nEi \"%s\" %s"))

  ;; Additional find file options
  (ivy-add-actions
   'counsel-find-file
   `(("p" (lambda (path)
            (with-ivy-window
              (insert (file-relative-name path default-directory)))) "insert relative path")
     ("P" (lambda (path)
            (with-ivy-window (insert path))) "insert absolute path")))

    ;; ignore . files or temporary files
  (setq counsel-find-file-ignore-regexp
        (concat
         ;; File names beginning with # or .
         "\\(?:\\`[#.]\\)"
         ;; File names ending with # or ~
         "\\|\\(?:\\`.+?[#~]\\'\\)")))

(use-package counsel-projectile
  :after (counsel projectile)
  :config (counsel-projectile-mode 1))

(provide 'counsel-common)
