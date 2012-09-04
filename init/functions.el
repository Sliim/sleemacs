(defun untabify-buffer ()
  "Untabify the entire buffer."
  (interactive)
  (untabify (point-min) (point-max))
)

;; show ascii table
;; optained from http://www.chrislott.org/geek/emacs/dotemacs.html
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))

(defun update-tags ()
  "Update tags table"
  (interactive)
  (shell-command "updateTags"))

;; Emacs configuration reloader
(defun reload-emacs-config ()
  "reload your .emacs file without restarting Emacs"
  (interactive)
  (load-file "~/.emacs"))
