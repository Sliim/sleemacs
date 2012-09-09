(when (file-exists-p "~/tags/TAGS")
  (visit-tags-table "~/tags/TAGS"))

(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/etags-select")
(require 'etags-select)

(global-set-key (kbd "C-c C-t") 'etags-select-find-tag)
