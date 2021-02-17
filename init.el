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
 '(ido-mode 'both nil (ido))
 '(package-selected-packages
   '(crux avy what-the-commit magit markdown-preview-mode markdown-mode rust-mode circe which-key chess pdf-tools org-superstar org-plus-contrib org))
 '(send-mail-function 'mailclient-send-it)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 141 :width normal))))
 '(term-color-blue ((t (:background "dark cyan" :foreground "dark cyan")))))

(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(require 'pdf-tools)
(require 'rust-mode)
(pdf-tools-install)

(add-hook 'prog-mode-hook 'linum-mode)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; visual bell instead of beeping
(setq visible-bell 1)

;; Avy
;; Input one char, jump to it with a tree.
;; C-: <char>
(global-set-key (kbd "C-:") 'avy-goto-char)

;; Input two consecutive chars, jump to the first one with a tree.
;; C-' <char><char>
(global-set-key (kbd "C-'") 'avy-goto-char-2)

;; disable tool-bar
(tool-bar-mode -1)

;; Which-key
(which-key-mode 1)
