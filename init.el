;; init packages
(setq package-archives
        '(("melpa" . "http://melpa.org/packages/")))
(package-initialize)
;; refresh contents on first start
(unless package-archive-contents
  (package-refresh-contents))

;; Declare packages
(setq my-packages
      '(which-key
	magit))

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
 '(package-selected-packages '(use-package multiple-cursors magit which-key))
 '(term-color-blue ((t (:background "dark cyan" :foreground "dark cyan")))))

;; linum-mode
(add-hook 'prog-mode-hook 'linum-mode)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; visual bell instead of beeping
(setq visible-bell 1)

;; disable tool-bar
(tool-bar-mode -1)

;;;;;;;;;;;;;;;
;; Which-key ;;
;;;;;;;;;;;;;;;
(which-key-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multiple cursors                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

;;;;;;;;;;;;;
;; compile ;;
;;;;;;;;;;;;;
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
