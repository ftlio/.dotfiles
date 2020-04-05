;; ~/.emacs.d/init.el

(setenv "SHELL" "bash")
(setq debug-on-error t)
(package-initialize)

;; Set directory
(defvar env-home (concat (getenv "HOME") "/"))
(setq user-emacs-directory (concat env-home ".emacs.d/"))
(setq default-directory env-home)

;; Init use-package
(load (locate-user-emacs-file "use-package-init.el") nil :nomessage)

;; MacOS path
(use-package exec-path-from-shell :ensure t)
(exec-path-from-shell-initialize)
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; Load client & UI related config
(load (locate-user-emacs-file "client.el") nil :nomessage)
(load (locate-user-emacs-file "keybindings.el") nil :nomessage)
(load (locate-user-emacs-file "whitespace.el") nil :nomessage)
(load (locate-user-emacs-file "theme.el") nil :nomessage)

;; Load common packages and config
(add-to-list 'load-path (concat user-emacs-directory "common/"))
(require 'yas-common)
(require 'projectile-common)
(require 'avy-common)
(require 'spacing-common)
(require 'company-common)
(require 'counsel-common)
(require 'swiper-common)
(require 'flycheck-common)
(require 'lsp-common)
(require 'git-common)

;; Load IDE
(add-to-list 'load-path (concat user-emacs-directory "ide/"))
(require 'misc-ide)

(require 'js-ide)
(require 'python-ide)
(require 'ruby-ide)
(require 'shell-ide)
(require 'ts-ide)
(require 'docker-ide)
(require 'go-ide)
(require 'make-ide)

;; Custom File
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;; install all packages (if they already not installed by use-package)
(package-install-selected-packages)

;; Start server
(require 'server)
(unless (server-running-p) (server-start))
