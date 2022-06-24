;;; init.el -*- lexical-binding: t; mode: emacs-lisp; coding:utf-8; fill-column: 80 -*-

;; <https://github.com/daviwil/dotfiles/blob/master/Emacs.org>
;; <https://github.com/bling/dotemacs/blob/master/init.el>
;; <https://github.com/mclear-tools/dotemacs/blob/master/init.el>

;; Some user information that various programs use
(setq user-full-name "Xavier Young"
      user-mail-address "younger321@foxmail.com")

;; Not load default.init shipped by OS or site
;; (setq inhibit-default-init t)

;; (setq initial-buffer-choice (lambda () (help-with-tutorial) (get-buffer "TUTORIAL")))

(setq inhibit-startup-screen t)

(menu-bar-mode 1)
;; (tool-bar-mode 1)
;; (scroll-bar-mode 1)

;; (setq linum-format "%d| ")
(global-linum-mode 1)
;; (global-display-line-numbers-mode 1)
;; (setq-default cursor-type 'bar)
(blink-cursor-mode -1)
;; (global-hl-line-mode 1)
;; (global-visual-line-mode)

(recentf-mode 1)
;; (setq recentf-max-menu-items 10)
;; Save minibuffer history
(setq history-length 25)
(savehist-mode 1)
;; Remember and restore the last cursor location of opened files
(save-place-mode 1)
;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)
;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

(setq make-backup-files nil)

(delete-selection-mode 1)
(electric-pair-mode 1)
;; (electric-indent-mode 1) ; @default
;; (show-paren-mode 1) ; @default
;; (xterm-mouse-mode 1)
;; (which-function-mode 1)
;; (transient-mark-mode 1)
;; (random 1) ;; seed

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

;; (defalias 'list-buffers 'ibuffer-other-window)
(defalias 'list-buffers 'ibuffer)

;; (defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
;; (setq backup-directory-alist `((".*" . ,emacs-tmp-dir)))
;; (setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t)))
;; (setq auto-save-list-file-prefix emacs-tmp-dir)

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

;; Don't pop up UI dialogs when prompting
;; (setq use-dialog-box nil)

;; Clean whitespaces before saving.
;; See also whitespace-style and indent-tabs-mode
;; (add-hook 'before-save-hook 'whitespace-cleanup)

;; Move customization variables to a separate file and load it
;; (setq custom-file (locate-user-emacs-file "custom.el"))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;; Start server - Now we can open any file with emacsclient
;; (unless (and (fboundp 'server-running-p)
;;              (server-running-p))
;;   (server-start))

;; (defun xy-server-start ()
;;   (require 'server)
;;   (unless (server-running-p)
;;     (server-start)))

;; (add-hook 'after-init-hook 'xy-server-start)

(global-set-key (kbd "C-h C-q") 'view-emacs-FAQ)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(global-set-key (kbd "C-h C-l") 'find-library)
(global-set-key (kbd "C-h K")   'describe-personal-keybindings)

;; Display file commentary section
;; (global-set-key (kbd "C-h C-c") 'finder-commentary)

(require 'info)
(define-key Info-mode-map (kbd "j") 'next-line)
(define-key Info-mode-map (kbd "k") 'previous-line)
(define-key Info-mode-map (kbd ".") 'Info-search-next)

(require 'help-mode)
(define-key help-mode-map (kbd "j") 'next-line)
(define-key help-mode-map (kbd "k") 'previous-line)
(define-key help-mode-map (kbd "b") 'beginning-of-buffer)
(define-key help-mode-map (kbd "e") 'end-of-buffer)

(defun xy-minibuffer-quit ()
  "消解minibuffer"
  (interactive)
  (if (string< "" (minibuffer-completion-contents))
      (backward-kill-sentence)
    (if (string< "" (minibuffer-contents))
        (kill-line)
      (minibuffer-keyboard-quit))))

;; (global-set-key (kbd "<escape>") 'delete-minibuffer-contents)
(define-key minibuffer-mode-map (kbd "<escape>") 'xy-minibuffer-quit)

(defun open-init-file ()
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

(defun xy-system-open-directory (file)
  "Open directory of file using the default application of the system."
  (interactive "fSystem open directory: ")
  (if (and (eq system-type 'windows-nt)
           (fboundp 'w32-shell-execute))
      (shell-command-to-string
       (encode-coding-string
        (replace-regexp-in-string "/" "\\\\"
                                  (format "explorer.exe %s"
                                          (file-name-directory (expand-file-name file))))
        'gbk))
    (call-process (pcase system-type
                    ('darwin "open")
                    ('cygwin "cygstart")
                    (_ "xdg-open"))
                  nil 0 nil (file-name-directory (expand-file-name file)))))

(defun xy-system-open-directory-2 (file)
  "Open directory of file using the default application of the system."
  (interactive "fSystem open directory: ")
  (call-process (pcase system-type
                  ('windows-nt "explorer.exe")
                  ('cygwin     "cygstart")
                  ('darwin     "open")
                  (_           "xdg-open"))
                nil 0 nil (file-name-directory (expand-file-name file))))

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
;; (add-hook 'after-init-hook 'emacs-workflow-open)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; (setq use-package-verbose t)
(setq use-package-always-ensure t)

(defalias 'use 'use-package)

;; (use org-bullets
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; (use esup
;;   :commands esup)

;; (use try)

(use keycast
  :config (keycast-mode t))

(use helpful
  :bind (("C-h f"   . #'helpful-callable) ;; Note that the built-in `describe-function' includes both functions and macros
         ("C-h F"   . #'helpful-function) ;; functions (excludes macros).
         ("C-h c"   . #'helpful-command) ;; interactive functions
         ("C-h v"   . #'helpful-variable)
         ("C-h k"   . #'helpful-key)
         ("C-h h"   . #'helpful-at-point)
         ("C-h o"   . #'helpful-symbol)
         :map helpful-mode-map
         ("j" . 'next-line)
         ("k" . 'previous-line)
         ("b" . 'beginning-of-buffer)
         ("e" . 'end-of-buffer))


  :init) ;; HACK: - see https://github.com/hlissner/doom-emacs/issues/6063

;; Provide examples of Elisp code
(use elisp-demos
  :defer 1
  :config
  ;; inject demos into helpful
  (advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update))

(use which-key
  :defer 1
  ;; :diminish ""
  :bind (("C-h '"  . which-key-show-major-mode)
         ("C-h \"" . which-key-show-keymap))
  :custom
  (which-key-ellipsis "..")
  ;; (which-key-dont-use-unicode t)
  (which-key-allow-imprecise-window-fit t)
  ;; (which-key-side-window-location 'top)
  (which-key-use-C-h-commands nil)
  (which-key-idle-delay .5)
  (which-key-idle-secondary-delay .05)
  :config
  (global-unset-key (kbd "C-h C-h"))
  ;; (define-key help-map "\C-h" 'which-key-C-h-dispatch)
  (which-key-mode))

(use ace-jump-mode
  :bind ("C-c j" . ace-jump-mode))

(use company
  :bind (:map company-active-map
              ("C-j" . #'company-select-next)
              ("C-k" . #'company-select-previous))
  :config
  (global-company-mode 1)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0))

(use vertico
  :hook (after-init . vertico-mode)
  :bind (:map vertico-map
              ("C-j"      . #'vertico-next)
              ("C-k"      . #'vertico-previous)
              ("C-n"      . #'vertico-next-group)
              ("C-p"      . #'vertico-previous-group)
              ("M-n"      . #'next-complete-history-element)
              ("M-p"      . #'previous-complete-history-element)
              ("M-RET"    . #'vertico-exit))
  :config
  (setq vertico-cycle t)
  (setq vertico-resize nil))

(use orderless
  :after vertico
  :config (setq completion-styles '(orderless)))

(use marginalia
  :after vertico
  :config
  (marginalia-mode t)
  (setq marginalia-align 'left))

(use embark
  :bind (("C-."   . embark-act)
         ("M-."   . embark-dwim)
         ("C-h ;" . embark-bindings-in-keymap) ;; TODO
         ("C-h :" . embark-bindings-in-keymap)
         ("C-h B" . embark-bindings)
         :map embark-file-map
         ("E"     . xy-system-open-directory))
  :init
  (setq prefix-help-command 'embark-prefix-help-command))

(use consult
  :bind (("C-s"   . consult-line)
         ("C-x b" . consult-buffer)))

;;; init.el ends here

