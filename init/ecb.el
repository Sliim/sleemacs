;; ecb
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/ecb")
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/cedet")
(require 'cedet)
(require 'ecb)

(setq ecb-tip-of-the-day nil)
(ecb-activate)
