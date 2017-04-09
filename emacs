
; package manager
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "https://stable.melpa.org/packages/")
   t)
  (package-initialize))

; web-mode auto start
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

; js2-mode for js files.
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

; c++ mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

; phpunit
;(global-set-key (kbd "C-x t") 'phpunit-current-test)    ; phpunit
;(global-set-key (kbd "C-x c") 'phpunit-current-class)   ; phpunit
;(global-set-key (kbd "C-x p") 'phpunit-current-project) ; phpunit


; default options
(setq warning-minimum-level :error)
(show-paren-mode 1)
(setq show-paren-delay 0)

; key combinations
(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window
(global-set-key (kbd "C-l") 'goto-line)    ; goto line

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

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


(eval-after-load 'autoinsert
  '(define-auto-insert '("\\.h\\'" . "C skeleton")
     '(
       "Short description: "
       "/**"\n
       "* "
       (file-name-nondirectory (buffer-file-name))\n
       "* " str \n
       "*" \n
       "* Written on " (format-time-string "%A, %e %B %Y.") \n
       "**/" > \n \n
       "#ifndef __"
       (upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))"_H__"\n
       "#define __"
       (upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))"_H__"\n
       \n
       "class "
       (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))\n
       "{"\n
       "};"\n
       \n
       "#endif // __"(upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))"_H__"\n
       )))


(auto-insert-mode)
