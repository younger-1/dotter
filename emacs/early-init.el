;;; early-init.el -*- lexical-binding: t; -*-

;; <https://github.com/SystemCrafters/rational-emacs/blob/master/early-init.el>
;; <https://github.com/doomemacs/doomemacs/blob/develop/early-init.el>

;; Emacs 27.1 introduced early-init.el, which is run before init.el, before
;; package and UI initialization happens, and before site files are loaded.

;; Increase the GC threshold for faster startup
;; The default is 800 kilobytes.  Measured in bytes.
;; (setq gc-cons-threshold (* 50 1000 1000))

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (defun reset-gc-cons-threshold ()
            (setq gc-cons-threshold 800000 gc-cons-percentage 0.1)))

;; optimize: set the file-name-handler to nil since regexing is cpu intensive.
;; (unless (or (daemonp) noninteractive)
;;   (let ((default-file-name-handler-alist file-name-handler-alist))
;;     (setq file-name-handler-alist nil)
;;     (add-hook 'emacs-startup-hook
;;               (defun reset-file-name-handler-alist ()
;;                 (setq file-name-handler-alist default-file-name-handler-alist)))))

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

;; Prefer loading newest compiled .el file
;; In noninteractive sessions, prioritize non-byte-compiled source files to
;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
;; to skip the mtime checks on every *.elc file.
;; !!!Slower
(setq load-prefer-newer noninteractive)

;; Native compilation settings
(when (featurep 'native-compile)
  ;; Silence compiler warnings as they can be pretty disruptive
  (setq native-comp-async-report-warnings-errors nil)

  ;; Set the right directory to store the native compilation cache
  (add-to-list 'native-comp-eln-load-path (expand-file-name "eln-cache/" user-emacs-directory)))

;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t)

;; Remove some unneeded UI elements (the user can turn back on anything they wish)
;; (push '(menu-bar-lines . 0) default-frame-alist)
;; (push '(tool-bar-lines . 0) default-frame-alist)
;; (push '(vertical-scroll-bars) default-frame-alist)
;; (push '(internal-border-width . 0) default-frame-alist)
;; (push '(mouse-color . "white") default-frame-alist)
;; (when (featurep 'ns)
;;   (push '(ns-transparent-titlebar . t) default-frame-alist))
(setq menu-bar-mode nil)
(setq tool-bar-mode nil)

;; (toggle-frame-maximized)
;; (toggle-frame-fullscreen)
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq default-frame-alist (quote ((fullscreen . maximized))))

;; The value is in 1/10pt, so 100 will give you 10pt.
;; C-x C-+ and C-x C-- to increase or decrease the buffer text size.
;; (set-face-attribute 'default nil :height 120)
;; (set-frame-font "Hack NF 10")
;; (add-to-list 'default-frame-alist '(font . "SauceCodePro NF-12"))

;;让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; Loads a nice blue theme, avoids the white screen flash on startup.
(load-theme 'deeper-blue t)

;; Make the initial buffer load faster by setting its mode to fundamental-mode
;; !!!Slower
;; (setq 'initial-major-mode 'fundamental-mode)

(set-language-environment "UTF-8")

;; set-language-enviornment sets default-input-method, which is unwanted
(setq default-input-method nil)

;; Inhibit package initialize
;; In Emacs 27+, package initialization occurs before `user-init-file' is
;; loaded, but after `early-init-file'.
;; (setq package-enable-at-startup nil)

;;; package configuration
(require 'package)

(setq package-quickstart t)

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

;; (package-initialize)

;;; early-init.el ends here

