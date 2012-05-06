;; Red Hat Linux default .emacs initialization file  ; -*- mode: emacs-lisp -*-

;; emacs-lisp local path
(setq load-path
      (append (list nil "~/elisp")
              load-path))

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; C-h Key mapping
(global-set-key "\C-h" 'delete-backward-char)

(keyboard-translate ?\C-h ?\C-?) ; translate `C-h' to DEL 
(keyboard-translate ?\C-? ?\C-h) ; translate DEL to `C-h'. 

;; turn on font-lock mode
(global-font-lock-mode t)
;; enable visual feedback on selections
(setq-default transient-mark-mode t)

;; always end a file with a newline
(setq require-final-newline t)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions))

;; Tab not space
(setq-default indent-tabs-mode nil)

;; set tab width
(setq-default tab-width 4 indent-tabs-mode nil)
;(setq-default tab-width 2 indent-tabs-mode nil)
;;;(add-hook 'shell-mode-hook
;;;	  '(lambda () (setq tab-witdh 8 indent-tabs-mode nil)))
;;;(add-hook 'tcl-mode-hook 
;;;	  '(lambda () (setq tab-width 4 indent-tabs-mode nil)))

;; Set language japanese
(set-language-environment "Japanese")
;(set-default-coding-systems 'euc-japan)
;(set-terminal-coding-system 'euc-japan)
;(set-buffer-file-coding-system 'euc-japan)
;(set-keyboard-coding-system 'euc-jp)
;(setq default-buffer-coding-system 'euc-jp)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-coding-system 'utf-8)

;; No backup file
(setq make-backup-files nil)

;;; Delete auto save files when exited
(setq delete-auto-save-files t)

;;; Ctrl-h BackSpace mode
;;(load "term/bobcat")
;;(cond ((string-match "22." emacs-version)
;;      (terminal-init-bobcat)))

;; Ruby mode
;;(autoload 'ruby-mode "ruby-mode"
;;  "Mode for editing ruby source files" t)
;;(setq auto-mode-alist
;;      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
;;(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
;;                                     interpreter-mode-alist))
;;(autoload 'run-ruby "inf-ruby"
;;  "Run an inferior Ruby process")
;;(autoload 'inf-ruby-keys "inf-ruby"
;;  "Set local key defs for inf-ruby in ruby-mode")
;;(add-hook 'ruby-mode-hook
;;          '(lambda ()
;;            (inf-ruby-keys)))

;; ActionScript mode
;;(autoload 'actionscript-mode "actionscript-mode" "actionscript" t)
;;(setq auto-mode-alist
;;      (append '(("\\.as$" . actionscript-mode))
;;              auto-mode-alist))

;;;; SubVersion Client
;;(require 'psvn)
;;;; 未変更は表示しない
;;(setq svn-status-hide-unmodified t)


(add-to-list 'load-path "/usr/share/doc/git-core/contrib/emacs")
(require 'git)
(require 'git-blame)

(add-hook 'php-mode-hook
          (lambda ()
            (c-set-offset 'case-label' 4)
            (c-set-offset 'arglist-intro' 4)
            (c-set-offset 'arglist-cont-nonempty' 4)
            (c-set-offset 'arglist-close' 0)))

; PHPモード
(add-hook 'php-mode-user-hook
          '(lambda ()
             (setq tab-width 4)
             (setq c-basic-offset 4)
             (setq indent-tabs-mode nil)))

; HTMLモード
(add-hook
 'sgml-mode-hook
 (lambda ()
   (setq
    sgml-basic-offset 4
    )))

(add-to-list 'auto-mode-alist (cons "\\.tpl\\'" 'smarty-mode))
(autoload 'smarty-mode "smarty-mode" "Smarty Mode" t)

(put 'set-goal-column 'disabled nil)
