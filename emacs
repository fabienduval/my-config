;; path where settings files are kept

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/settings")
;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)

;; install dependencies with el-get
(require 'el-get-settings)

;---------------;
;;; Utilities ;;;
;---------------;

;; Git
(include-plugin "magit")
(require 'magit)

(setq auto-mode-alist (delete '("git-rebase-todo" . rebase-mode)
                              auto-mode-alist))

(global-set-key (kbd "C-x g") 'magit-status)

;; Popup
(include-elget-plugin "popup")
(require 'popup)

;; Websocket
(include-plugin "websocket")
(require 'websocket)

;; Request
(include-plugin "request")
(require 'request)

;; yasnippet
(require 'yasnippet-settings)

;; Auto complete
(require 'auto-complete-settings)

;; Camelcase functions
(require 'camelcase-settings)

;; Helm
(require 'helm-settings)


;-----------;
;;; Modes ;;;
;-----------;

;; Ido mode
(require 'ido)
(ido-mode 1)

;; Markdown mode
(require 'markdown-settings)

;; Python mode
(require 'python-settings)

;; LaTeX and Auctex
(require 'latex-settings)

;; Javascript
(require 'js-settings)

;; YAML mode
(require 'yaml-settings)

;; Nyancat mode!
(nyan-mode 1)


;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)

; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default show-trailing-whitespace t)


; tab is 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq c-default-style "linux"
          c-basic-offset 4)
          (setq sgml-basic-offset 4)

(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window
(global-set-key (kbd "C-l") 'goto-line)    ; goto line

(global-set-key (kbd "C-x t") 'phpunit-current-test)    ; phpunit
(global-set-key (kbd "C-x c") 'phpunit-current-class)   ; phpunit
(global-set-key (kbd "C-x p") 'phpunit-current-project) ; phpunit


; php coding style
(require 'flymake-phpcs)
(add-hook 'php-mode-hook 'flymake-phpcs-load)
(custom-set-variables
 '(flymake-phpcs-standard "~/git/backend/php-common/netatmo_ruleset.xml"))
(custom-set-variables
 '(flymake-phpcs-options "-n"))


;--------------------------------------------------------------------

(defun ssh (args)
  "Connect to a remote host by SSH."
  (interactive "sssh ")
  (let ((switches (split-string-and-unquote args)))
    (set-buffer (apply 'make-term "ssh" "ssh" nil switches))
    (term-mode)
    (term-char-mode)
    (switch-to-buffer "*ssh*")))
