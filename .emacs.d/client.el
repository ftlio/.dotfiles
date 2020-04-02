;; ~/.emacs.d/client.el

;; Stolen from:
;; Copyright (C) 2016-2020 Chakravarthy Raghunandan
;; Author: Chakravarthy Raghunandan <rnraghunandan@gmail.com>

(setq package-quickstart t)

;; Defer garbage collection further back in the startup process
;; (setq gc-cons-threshold most-positive-fixnum
;;       gc-cons-percentage 0.6)

;; Prevent the glimpse of un-styled Emacs by disabling these UI elements early.
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

;; Resizing the Emacs frame can be a terribly expensive part of changing the
;; font. By inhibiting this, we easily halve startup times with fonts that are
;; larger than the system default.
(setq frame-inhibit-implied-resize t)

;; Remove command line options that aren't relevant to our current OS; means
;; slightly less to process at startup.
(unless (eq system-type 'darwin)
  (setq command-line-ns-option-alist nil))
(unless (eq system-type 'gnu/linux)
  (setq command-line-x-option-alist nil))

;; Ignore X resources; its settings would be redundant with the other settings
;; in this file and can conflict with later config (particularly where the
;; cursor color is concerned).
(advice-add #'x-apply-session-resources :override #'ignore)

;; Reduce window-fringes
(set-window-fringes nil 0 0)

;; Kill startup screen and set default directory
(setq inhibit-startup-screen t)

;; Turn off the bell
(setq ring-bell-function 'ignore)
