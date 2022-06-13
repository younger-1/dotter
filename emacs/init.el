;; -*- lexical-binding: t; -*-
;;; init.el  -*- lexical-binding: t; mode: emacs-lisp; coding:utf-8; fill-column: 80 -*-

;; <https://github.com/daviwil/dotfiles/blob/master/Emacs.org>
;; <https://github.com/bling/dotemacs/blob/master/init.el>
;; <https://github.com/mclear-tools/dotemacs/blob/master/init.el>

;; The default is 800 kilobytes.  Measured in bytes.
;; (setq gc-cons-threshold (* 50 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
  (lambda ()
    (message "*** Emacs loaded in %s seconds with %d garbage collections."
      (emacs-init-time "%.2f") gcs-done)))

;; (let ((emacs-start-time (current-time)))
;;   (add-hook 'emacs-startup-hook
;;     (lambda ()
;;       (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
;;         (message "[Emacs initialized in %.3fs]" elapsed)))))

;; (setq initial-buffer-choice (lambda () (help-with-tutorial) (get-buffer "TUTORIAL")))

;; Not load default.init shipped by OS or site
;; (setq inhibit-default-init t)

;; (setq inhibit-startup-message t)

(global-linum-mode 1)
;; (setq linum-format "%d| ")

;; Hightlight current line
;; (global-hl-line-mode 1)

;; Hide bars
;; (menu-bar-mode -1)
(tool-bar-mode -1)
;; (scroll-bar-mode -1)

;; (global-visual-line-mode)
;; (xterm-mouse-mode t)
;; (which-function-mode t)
;; (blink-cursor-mode -1)
;; (global-auto-revert-mode t)
;; (electric-indent-mode t)
(electric-pair-mode t)
;; (transient-mark-mode t)
(delete-selection-mode t)
;; (random t) ;; seed

;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

;; (icomplete-mode 1)

(setq tab-always-indent 'complete)

(global-company-mode 1)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)

;; Show time
;; (display-time-mode 1)
;; (setq display-time-24hr-format t)
;; (setq display-time-day-and-date t)

(put 'narrow-to-region 'disabled nil)

(defalias 'list-buffers 'ibuffer-other-window)
;; (defalias 'list-buffers 'ibuffer)

;; (toggle-frame-maximized)
;; (toggle-frame-fullscreen)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq default-frame-alist (quote ((fullscreen . maximized))))

;; Prevent Custom from modifying this file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

(global-set-key (kbd "C-h C-q") 'view-emacs-FAQ)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.config/emacs/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)

;; <https://jao.io/blog/2021-09-08-high-signal-to-noise-emacs-command.html>
(defun xy-buffer-same-mode (&rest modes)
  "Pop to a buffer with a mode among MODES, or the current one if not given."
  (interactive)
  (let* ((modes (or modes (list major-mode)))
         (pred (lambda (b)
                 (let ((b (get-buffer (if (consp b) (car b) b))))
                   (member (buffer-local-value 'major-mode b) modes)))))
    (pop-to-buffer (read-buffer "Buffer: " nil t pred))))

(global-set-key (kbd "<f3>") 'xy-buffer-same-mode)

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

;; (require 'package)
;; Prevent package.el from modifying this file.
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; (package-initialize)

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

(use-package company
  :ensure t)

;; To activate and use Nord Emacs as your default color theme load it in your init file:
;; (load-theme 'nord t)
