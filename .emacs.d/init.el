;; Red Hat Linux default .emacs initialization file  ; -*- mode: emacs-lisp -*-

;; emacs-lisp local path
(let ((default-directory (expand-file-name "~/.emacs.d/lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

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

;; display text column number
(column-number-mode 1)

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

;; Set language japanese
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8) 
;(set-default-coding-systems 'euc-japan)
;(set-terminal-coding-system 'euc-japan)
;(set-buffer-file-coding-system 'euc-japan)
;(set-keyboard-coding-system 'euc-jp)
;(setq default-buffer-coding-system 'euc-jp)
;(set-default-coding-systems 'utf-8)
;(set-terminal-coding-system 'utf-8)
;(set-keyboard-coding-system 'utf-8)
;(set-buffer-file-coding-system 'utf-8)
;(setq default-buffer-coding-system 'utf-8)

;; No backup file
(setq make-backup-files nil)

;;; Delete auto save files when exited
(setq delete-auto-save-files t)

;; ActionScript mode
;;(autoload 'actionscript-mode "actionscript-mode" "actionscript" t)
;;(setq auto-mode-alist
;;      (append '(("\\.as$" . actionscript-mode))
;;              auto-mode-alist))


; PHP mode
(add-hook 'php-mode-hook
          (lambda ()
            (c-set-offset 'case-label' 4)
            (c-set-offset 'arglist-intro' 4)
            (c-set-offset 'arglist-cont-nonempty' 4)
            (c-set-offset 'arglist-close' 0)))
(add-hook 'php-mode-user-hook
          '(lambda ()
             (setq tab-width 4)
             (setq c-basic-offset 4)
             (setq indent-tabs-mode nil)))

; HTML mode
(add-hook
 'sgml-mode-hook
 (lambda ()
   (setq
    sgml-basic-offset 4
    )))

(autoload 'smarty-mode "smarty-mode" "Smarty Mode" t)
(setq auto-mode-alist
      (append
       '((\"\\.tpl$\" . smarty-mode))
       auto-mode-alist))

(put 'set-goal-column 'disabled nil)

;; assign c++ mode to c header
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

; ruby
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)
