;; <https://github.com/daviwil/dotfiles/blob/master/Emacs.org>
;; -*- lexical-binding: t; -*-

;; The default is 800 kilobytes.  Measured in bytes.
;; (setq gc-cons-threshold (* 50 1000 1000))

;; Profile emacs startup
; (add-hook 'emacs-startup-hook
;           (lambda ()
;             (message "*** Emacs loaded in %s seconds with %d garbage collections."
;                      (emacs-init-time "%.2f")
;                      gcs-done)))

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
; (package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Not load default.init shipped by OS or site
; (setq inhibit-default-init t)

(setq inhibit-startup-message t)

(global-linum-mode 1)
; (setq linum-format "%d| ")

;; Hightlight
(global-hl-line-mode 1)

;; Hide bars
; (menu-bar-mode 0)
(tool-bar-mode 0)
; (scroll-bar-mode 0)

;; Show time
; (display-time-mode 1)
; (setq display-time-24hr-format t)
; (setq display-time-day-and-date t)

(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq default-frame-alist (quote ((fullscreen . maximized))))

;; To activate and use Nord Emacs as your default color theme load it in your init file:
;; (load-theme 'nord t)

(put 'narrow-to-region 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(which-key use-package try)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
