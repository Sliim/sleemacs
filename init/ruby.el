;;TODO Cleanup

;; ruby-mode
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/ruby-mode")
(require 'ruby-mode)
(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'turn-on-font-lock)
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))


;; ruby electric
(defun try-complete-abbrev (old)
  (if (expand-abbrev) t nil))
(setq hippie-expand-try-functions-list
     '(try-complete-abbrev
   try-complete-file-name
   try-expand-dabbrev))


;; ri-emacs
(setq ri-ruby-script (expand-file-name "~/.emacs.d/sleemacs/plugins/ri-emacs/ri-emacs.rb"))
;(autoload 'ri (expand-file-name "~/.emacs.d/plugins/ri-emacs/ri-ruby.el") nil t)
(load "~/.emacs.d/sleemacs/plugins/ri-emacs/ri-ruby.el")


;; ruby-mode-hook
(add-hook 'ruby-mode-hook
         (lambda()
           (add-hook 'write-file-functions
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
           (set (make-local-variable 'indent-tabs-mode) 'nil)
           (set (make-local-variable 'tab-width) 2)
           (imenu-add-to-menubar "IMENU")
;           (require 'ruby-electric)
           (ruby-electric-mode t)
;           (require 'ruby-block)
           (ruby-block-mode t)
;           (local-set-key 'f1 'ri)
           (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
;           (local-set-key 'f4 'ri-ruby-show-args)
           (define-key ruby-mode-map "\M-\C-o" 'rct-complete-symbol)
           (local-set-key (kbd "<return>") 'newline-and-indent)
))
