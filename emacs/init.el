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
;; (icomplete-vertical-mode 1)
;; (custom-set-variables
;;   '(icomplete-show-matches-on-no-input t)
;;   '(icomplete-hide-common-prefix nil)
;;   '(icomplete-compute-delay 0.0)
;;   '(icomplete-scroll t)
;;   '(completion-ignore-case t)
;;   '(read-buffer-completion-ignore-case t)
;;   '(read-file-name-completion-ignore-case t))

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

;; Clean whitespaces before saving.
;; See also whitespace-style and indent-tabs-mode
;; (add-hook 'before-save-hook 'whitespace-cleanup)

;; (defalias 'list-buffers 'ibuffer-other-window)
(defalias 'list-buffers 'ibuffer)

;; (toggle-frame-maximized)
;; (toggle-frame-fullscreen)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq default-frame-alist (quote ((fullscreen . maximized))))

;; The value is in 1/10pt, so 100 will give you 10pt.
;; C-x C-+ and C-x C-- to increase or decrease the buffer text size.
;; (set-face-attribute 'default nil :height 120)
;; (set-frame-font "Hack NF 10")
;; (add-to-list 'default-frame-alist '(font . "SauceCodePro NF-12"))

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
(global-set-key (kbd "C-h C-l") 'find-library)
(global-set-key (kbd "C-h K")   'describe-personal-keybindings)

;; Display file commentary section
;; (global-set-key (kbd "C-h C-c") 'finder-commentary)

(defun open-init-file()
  "打开emacs配置文件"
  (interactive)
  (find-file user-init-file))

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

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
;; (setq use-package-verbose t)
(setq use-package-always-ensure t)

;; (use-package org-bullets
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; (use-package esup
;;   :commands esup)

;; (use-package try)

(use-package keycast
  :config (keycast-mode t))

(use-package helpful
  :bind (("C-h f"   . #'helpful-callable) ;; Note that the built-in `describe-function' includes both functions and macros
         ("C-h F"   . #'helpful-function) ;; functions (excludes macros).
         ("C-h c"   . #'helpful-command) ;; interactive functions
         ("C-h v"   . #'helpful-variable)
         ("C-h k"   . #'helpful-key)
         ("C-h h"   . #'helpful-at-point)
         ("C-h o"   . #'helpful-symbol))
  :init) ;; HACK: - see https://github.com/hlissner/doom-emacs/issues/6063

;; Provide examples of Elisp code
(use-package elisp-demos
  :defer 1
  :config
  ;; inject demos into helpful
  (advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update))

(use-package which-key
  :defer 1
  ;; :diminish ""
  :custom
  ;; (which-key-ellipsis "..")
  ;; (which-key-dont-use-unicode t)
  (which-key-allow-imprecise-window-fit t)
  ;; (which-key-side-window-location 'top)
  (which-key-show-early-on-C-h t)
  (which-key-idle-delay .45)
  (which-key-idle-secondary-delay 0.05)
  :config
  (which-key-mode))

(use-package company
  :bind (:map company-active-map
         ("C-j" . #'company-select-next)
         ("C-k" . #'company-select-previous))
  :config
  (global-company-mode 1)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0))

(use-package vertico
  :hook (after-init . vertico-mode)
  :bind (:map vertico-map
         ("<escape>" . #'minibuffer-keyboard-quit)
         ("C-n"      . #'vertico-next-group)
         ("C-p"      . #'vertico-previous-group)
         ("C-j"      . #'vertico-next)
         ("C-k"      . #'vertico-previous)
         ("M-RET"    . #'vertico-exit))
  :config
  (setq vertico-cycle t)
  (setq vertico-resize nil))

(use-package orderless
  :after vertico
  :config (setq completion-styles '(orderless)))

(use-package marginalia
  :after vertico
  :config
  (marginalia-mode t)
  (setq marginalia-align 'left))

(use-package embark
  :bind (("C-."   . embark-act)
         ("M-."   . embark-dwim)
         ("C-h ;" . embark-bindings)))
;;; init.el ends here

