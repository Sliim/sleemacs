;; anything
(add-to-list 'load-path "~/.emacs.d/plugins/anything")
(require 'anything)

;; anything-rcodetools
(add-to-list 'load-path "~/.emacs.d/plugins/rcodetools")
(require 'anything-rcodetools)
(setq rct-get-all-methods-command "PAGER=cat fri -l -L")
(define-key anything-map "\C-z" 'anything-execute-persistent-action)
;(rct-get-all-methods)

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)
