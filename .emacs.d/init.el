;; ~/.emacs.d/init.el

;; Default Directory

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq default-directory "~/.emacs.d/lisp")
(normal-top-level-add-to-load-path '("./"))
(normal-top-level-add-subdirs-to-load-path)

;; Ensure use-package is installed
(require 'use-package-install)

;; Load common stuff
(require 'company-common)
(require 'yas-common)
(require 'theme-common)

;; Load JS IDE
(require 'js-ide)

;; Load "Shell" IDE
(require 'shell-ide)

;; Whitespace
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

;; Custom File
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;; Visuals
(tool-bar-mode -1)
(set-frame-parameter nil 'fullscreen 'fullboth)
(scroll-bar-mode -1)
(set-window-fringes nil 0 0)

;; Electric Pair Everywhere for now
(electric-pair-mode 1)

;; Switch Frames
(global-set-key (kbd "M-`") 'other-frame)

;; ADD NODE to the Path for prettier js and other utils
;; NVM makes this difficult
;; TODO: Make this better
(setenv "PATH" (concat (getenv "PATH") ":/home/andy/.nvm/versions/node/v8.4.0/bin"))
(setq exec-path (append exec-path '("/home/andy/.nvm/versions/node/v8.4.0/bin")))

;; Kill startup screen and set default directory
(setq inhibit-startup-screen t)
(setq default-directory "~/scratch/")

;; Org Mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
