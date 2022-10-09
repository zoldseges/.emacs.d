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
	use-package
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
 '(column-number-mode t)
 '(custom-enabled-themes '(tango-dark))
 '(font-use-system-font t)
 '(package-selected-packages
   '(elpy haskell-mode scad-mode org-roam yaml-mode flutter lsp-dart go-mode lsp-java rust-mode glsl-mode use-package multiple-cursors magit which-key))
 '(show-paren-mode t)
 '(term-color-blue ((t (:background "dark cyan" :foreground "dark cyan"))))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight normal :height 120 :width normal)))))
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

;; mv and cp files in dired
;; https://emacs.stackexchange.com/a/5604/31726
(setq dired-dwim-target t)

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

;;;;;;;;;;;;;;;;;;
;; transparency ;;
;;;;;;;;;;;;;;;;;;

;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;;(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(85 . 50) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))


;; clangd-emacs-ide
;; https://ddavis.io/posts/clangd-emacs-ide/
;; Debian 11: clang, clangd, clang-tools

;; (use-package company-lsp
;;   :ensure t
;;   :config
;;   (push 'company-lsp company-backends)
;;   (add-hook 'after-init-hook 'global-company-mode))

(use-package lsp-mode
  :ensure t
  :commands lsp)

(use-package lsp-ui
  :ensure t)

(use-package lsp-clangd
  :load-path
  "~/.emacs.d/lsp-clangd"
  :init
  (add-hook 'c++-mode-hook 'lsp-clangd-c++-enable))

;; Start completion with C-=
(global-set-key (kbd "C-=") 'company-complete)

;; GLSL
(add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
