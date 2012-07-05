;; yasnippet
(add-to-list 'load-path "/usr/share/emacs/site-lisp/yasnippet")
(require 'yasnippet)

(yas/initialize)

(setq yas/root-directory '(
                           "/usr/share/emacs/site-lisp/yasnippet/snippets"
                           "~/.emacs.d/plugins/yas/snippets/php-mode"
                          )
)

(mapc 'yas/load-directory yas/root-directory)
