;; path where settings files are kept

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;--------------------;
;;; General config ;;;
;--------------------;

(set-background-color "#000000")
(add-to-list 'default-frame-alist '(background-color . "#000000"))

; Indent 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq c-default-style "linux"
          c-basic-offset 4)
          (setq sgml-basic-offset 4)

; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default show-trailing-whitespace t)

; goto line
(global-set-key (kbd "C-l") 'goto-line)

;-----------------------------;
;;; Add the package manager ;;;
;-----------------------------;
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;---------------;
;;; Utilities ;;;
;---------------;

(setq auto-mode-alist (delete '("git-rebase-todo" . rebase-mode)
                              auto-mode-alist))

;; Auto complete
; (require 'auto-complete-settings)

;-----------;
;;; Modes ;;;
;-----------;

;; Python mode
;(require 'python-settings)

;; Javascript
;(require 'js-settings)

; php coding style
;(require 'flymake-phpcs)
;(add-hook 'php-mode-hook 'flymake-phpcs-load)
;(custom-set-variables '(flymake-phpcs-standard "~/git/backend/php-common/netatmo_ruleset.xml"))
;(custom-set-variables '(flymake-phpcs-options "-n"))
