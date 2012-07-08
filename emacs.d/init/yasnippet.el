;; yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)

(yas/initialize)

(setq yas/root-directory '(
                           "~/.emacs.d/plugins/yasnippet/snippets"
                           "~/.emacs.d/plugins/yas/snippets/php-mode"
                          )
)

(mapc 'yas/load-directory yas/root-directory)
