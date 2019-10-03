;; ~/.emacs.d/init.el

(package-initialize)

;; Set load path
(setq default-directory "~/.emacs.d/lisp")
(normal-top-level-add-to-load-path '("./"))
(normal-top-level-add-subdirs-to-load-path)

;; Ensure use-package is installed
(require 'use-package-install)

;; Fix MacOS Env Problems
(use-package exec-path-from-shell
  :ensure t)
(exec-path-from-shell-initialize)

;; Load common stuff
(require 'company-common)
(require 'yas-common)
(require 'theme-common)
(require 'key-bindings)
(require 'my-vc)

;; Load "IDEs"
(require 'js-ide)
(require 'python-ide)
(require 'ruby-ide)
(require 'shell-ide)
(require 'ts-ide)

;; Custom File
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;; Whitespace
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Visuals
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-window-fringes nil 0 0)

;; Electric Pair Everywhere for now
(electric-pair-mode 1)

;; Kill startup screen and set default directory
(setq inhibit-startup-screen t)
(setq default-directory "~/")

;; Turn off the damn bell
(setq ring-bell-function 'ignore)

;; Path things
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
