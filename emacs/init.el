;;; init.el -*- lexical-binding: t; mode: emacs-lisp; coding:utf-8; fill-column: 80 -*-

;; <https://github.com/daviwil/dotfiles/blob/master/Emacs.org>
;; <https://github.com/bling/dotemacs/blob/master/init.el>
;; <https://github.com/mclear-tools/dotemacs/blob/master/init.el>

;; Not load default.init shipped by OS or site
;; (setq inhibit-default-init t)

;; (setq initial-buffer-choice (lambda () (help-with-tutorial) (get-buffer "TUTORIAL")))

;; (setq inhibit-startup-message t)

(menu-bar-mode 1)
;; (tool-bar-mode 1)
;; (scroll-bar-mode 1)

(delete-selection-mode t)
(global-linum-mode 1)
;; (setq linum-format "%d| ")
(electric-pair-mode t)
;; (electric-indent-mode t)
;; (global-hl-line-mode 1)
;; (global-visual-line-mode)
;; (xterm-mouse-mode t)
;; (which-function-mode t)
;; (blink-cursor-mode -1)
;; (global-auto-revert-mode t)
;; (transient-mark-mode t)
;; (random t) ;; seed

;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

;; (icomplete-mode 1)

;; (setq tab-always-indent 'complete)

;; Show time
;; (display-time-mode 1)
;; (setq display-time-24hr-format t)
;; (setq display-time-day-and-date t)

;; Enable default disabled stuff
(put 'narrow-to-region 'disabled nil)
;; (put 'downcase-region 'disabled nil)
;; (put 'upcase-region 'disabled nil)
;; (put 'erase-buffer 'disabled nil)
;; (put 'scroll-left 'disabled nil)

;; Use y and n as confirmations
(fset 'yes-or-no-p 'y-or-n-p)

;; clean whitespaces before saving
(add-hook 'before-save-hook 'whitespace-cleanup)

(defalias 'list-buffers 'ibuffer-other-window)
;; (defalias 'list-buffers 'ibuffer)

;; (toggle-frame-maximized)
;; (toggle-frame-fullscreen)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq default-frame-alist (quote ((fullscreen . maximized))))

;; The value is in 1/10pt, so 100 will give you 10pt.
;; C-x C-+ and C-x C-- to increase or decrease the buffer text size.
;; (set-face-attribute 'default nil :height 120)
;; (set-frame-font "Hack NF 10")

;;让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; Prevent Custom from modifying this file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;; Start server - Now we can open any file with emacsclient
;; (unless (and (fboundp 'server-running-p)
;;              (server-running-p))
;;   (server-start))

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

;;; package configuration
;; (require 'package)

;; Emacs 27.x has gnu elpa as the default
;; Emacs 28.x adds the nongnu elpa to the list by default, so only
;; need to add nongnu when this isn't Emacs 28+
;; (when (version< emacs-version "28")
;;   (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/")))
;; (add-to-list 'package-archives '("stable" . "https://stable.melpa.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(customize-set-variable 'package-archive-priorities
                        '(("gnu"    . 99)   ; prefer GNU packages
                          ("nongnu" . 80)   ; use non-gnu packages if not found in GNU elpa
                          ("stable" . 70)   ; prefer "released" versions from melpa
                          ("melpa"  . 0)))  ; if all else fails, get it

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
;; (setq use-package-verbose t)
(setq use-package-always-ensure t)

;; (use-package org-bullets
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; (use-package esup
;;   :commands esup)

(use-package try)

(use-package which-key
  :config (which-key-mode))

(use-package company
  :config
  (global-company-mode 1)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0))

(use-package keycast
  :config (keycast-mode t))
;;; init.el ends here

