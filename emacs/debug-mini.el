;;; -*- lexical-binding: t; -*-

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

;; (add-hook 'emacs-startup-hook
;;           (lambda ()
;;             (message "*** Emacs loaded in %s with %d garbage collections."
;;                      (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time)))
;;                      gcs-done)))

