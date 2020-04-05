;; ~/.emacs.d/init.el

(setenv "SHELL" "bash")
(setq debug-on-error t)
(package-initialize)

;; Set directory
(defvar env-home (concat (getenv "HOME") "/"))
(setq user-emacs-directory (concat env-home ".emacs.d/"))
(setq default-directory env-home)

;; Load Env
(load (locate-user-emacs-file "use-package-init.el") nil :nomessage)
(use-package exec-path-from-shell :ensure t)
(exec-path-from-shell-initialize)
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; Load UI/Client related config
(load (locate-user-emacs-file "client.el") nil :nomessage)
(load (locate-user-emacs-file "theme.el") nil :nomessage)

;; Load IDE
(add-to-list 'load-path (concat user-emacs-directory "ide/"))
(require 'whitespace-ide)
(require 'company-ide)
(require 'yas-ide)
(require 'flycheck-ide)
(require 'ivy-ide)
(require 'misc-ide)
(require 'key-bindings-ide)

(require 'lsp-ide)
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
