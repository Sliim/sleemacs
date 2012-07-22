(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/auto-complete-etags")
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/auto-complete")

(require 'auto-complete-config)
(ac-config-default)

(when (require 'auto-complete nil t)
   (global-auto-complete-mode t)           ;enable global-mode
   (make-local-variable 'ac-sources)
   (setq ac-auto-start nil)                ;not automatically start
   (setq ac-dwim 3)                        ;Do what i mean
   (setq ac-override-local-map nil)        ;don't override local map
   (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer))

   (require 'auto-complete-etags)
   (add-to-list 'ac-sources 'ac-source-etags)

   (setq ac-modes
         (append ac-modes
                 '(eshell-mode
                   )))

   (add-hook 'emacs-lisp-mode-hook
             (lambda ()
               (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-symbols))))

   (add-hook 'eshell-mode-hook
             (lambda ()
               (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-files-in-current-dir ac-source-words-in-buffer))))

   (add-hook 'ruby-mode-hook
             (lambda ()
               (setq ac-omni-completion-sources '(("\\.\\=" ac-source-rcodetools))))

   (global-set-key (kbd "C-SPC") 'auto-complete)))
