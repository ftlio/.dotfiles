;; ~/.emacs.d/ide/key-bindings-ide.el

;; Switch Frames
(global-set-key (kbd "M-`") 'other-frame)

;; Deal with MacOS
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq mac-control-modifier 'control)

(provide 'key-bindings-ide)
