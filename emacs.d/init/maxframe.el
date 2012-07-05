;; maxframe
(add-to-list  'load-path "~/.emacs.d/plugins/maxframe")
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
(add-hook 'window-setup-hook 'ecb-redraw-layout t)

(mouse-wheel-mode t)
