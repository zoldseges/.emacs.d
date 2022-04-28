;; init packages
(setq package-archives '(
    ("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
;; refresh contents on first start
(unless package-archive-contents
  (package-refresh-contents))

;; Declare packages
(setq my-packages
      '(which-key
	magit
	multiple-cursors
	;; flutter
	dart-mode
	lsp-mode
	lsp-dart
	lsp-treemacs
	flycheck
	lsp-ui
	company
	hover))

;; Iterate on packages and install missing ones
(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(font-use-system-font t)
 '(package-selected-packages
   '(yaml-mode flutter lsp-dart go-mode lsp-java rust-mode glsl-mode use-package multiple-cursors magit which-key))
 '(term-color-blue ((t (:background "dark cyan" :foreground "dark cyan"))))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight normal :height 98 :width normal)))))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; linum-mode
(add-hook 'prog-mode-hook 'linum-mode)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; visual bell instead of beeping
(setq visible-bell 1)

;; disable tool-bar
(tool-bar-mode -1)

;; show-parenthesis
(show-paren-mode 1)

(linum-mode 1)
;; cursor pos
(column-number-mode 1)
(line-number-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; generate ascending numbers	  ;;
;; shorturl.at/vFGH0		  ;;
;; 				  ;;
;; with-appointed-amount-in-emacs ;;
;; set-mark			  ;;
;; type enter 90 times		  ;;
;; C-u C-x r N Enter %3d Enter	  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;
;; Which-key ;;
;;;;;;;;;;;;;;;
(which-key-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multiple cursors                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;;;;;;;;;;;;;
;; compile ;;
;;;;;;;;;;;;;
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)

;;;;;;;;;;;;;;;;;
;; winner-mode ;;
;;;;;;;;;;;;;;;;;
(winner-mode 1)

;;;;;;;;;;;;;
;; Flutter ;;
;;;;;;;;;;;;;

(add-hook 'dart-mode-hook 'lsp)

(setq gc-cons-treshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024))
