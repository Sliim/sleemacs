;; yasnippet
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/yasnippet")
(require 'yasnippet)

(yas/initialize)

(setq yas/root-directory '(
                           "~/.emacs.d/sleemacs/plugins/yasnippet/snippets"
                           "~/.emacs.d/sleemacs/plugins/yas/snippets/php-mode"
                          )
)

(mapc 'yas/load-directory yas/root-directory)
