(grep-compute-defaults)
(add-to-list 'grep-find-ignored-directories ".emacs")
(add-to-list 'grep-find-ignored-directories "logs")
(add-to-list 'grep-files-aliases (cons "php" "*.php *.phtml"))
(add-to-list 'grep-files-aliases (cons "js" "*.js"))
(setq grep-find-template "find -L . <X> -type f <F> -print0 | \"xargs\" -0 -e grep <C> -nH -e <R>")

(defun grep-compute-defaults ()
"Hack to keep my changes...")
