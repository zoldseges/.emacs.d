(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(term-color-blue ((t (:background "dark cyan" :foreground "dark cyan")))))

(add-hook 'prog-mode-hook 'linum-mode)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; visual bell instead of beeping
(setq visible-bell 1)

;; disable tool-bar
(tool-bar-mode -1)

;; Which-key
(which-key-mode 1)
