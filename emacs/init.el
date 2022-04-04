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

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

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

;; (defun emacs-workflow-open ()
;;   ;(interactive)
;;   (split-window-right)
;;   (other-window 1)
;;   (split-window-below)
;;   (other-window 1)
;;   (multi-term)
;;   (rename-buffer "term-run")
;;   (multi-term)
;;   (rename-buffer "term-test")
;;   (multi-term)
;;   (rename-buffer "term")
;;   (switch-to-buffer "term-run"))
;; (add-hook 'after-init-hook #'emacs-workflow-open)

;; To activate and use Nord Emacs as your default color theme load it in your init file:
;; (load-theme 'nord t)

(put 'narrow-to-region 'disabled nil)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; (defalias 'list-buffers 'ibuffer-other-window)
(defalias 'list-buffers 'ibuffer)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(org-bullets which-key use-package try)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Hack NF")))))
