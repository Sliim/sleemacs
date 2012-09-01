;; ecb
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/ecb")
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/cedet")
(require 'cedet)
(require 'ecb)

(setq ecb-tip-of-the-day nil)
(ecb-activate)

(global-set-key (kbd "C-c d") 'ecb-goto-window-directories)
(global-set-key (kbd "C-c e") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-c h") 'ecb-goto-window-history)
(global-set-key (kbd "C-c s") 'ecb-goto-window-sources)
(global-set-key (kbd "C-c m") 'ecb-goto-window-methods)

(global-set-key (kbd "C-c C-,") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-c C-;") 'ecb-hide-ecb-windows)
