;; (require 'package)
;; (package-initialize)
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives
;;              '("org" . "http://orgmode.org/elpa/") t)

;;; Code:

(require 'cask "~/.emacs.d/cask/cask.el")
(cask-initialize)

(global-visual-line-mode t)
(delete-selection-mode -1)
(blink-cursor-mode 1)

(show-paren-mode t)
(setq show-paren-delay 0)

;;(desktop-save-mode -1)
(desktop-save-mode 1)

(defvar --backup-directory (concat user-emacs-directory "saves"))
(setq backup-directory-alist  `(("." . ,--backup-directory )))
(setq make-backup-file nil)
(setq auto-save-default nil)
(setq make-auto-save-file-name nil)
(setq auto-save-mode -1)

(setq inhibit-startup-message -1)

(setq-default frame-title-format "%b (%f)")

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)

;;Scroll

(setq mouse-wheel-scroll-amount '(2))
(setq mouse-wheel-progressive-speed nil)

;;Disable version control
(setq vc-handled-backends ())
(remove-hook 'find-file-hooks 'vc-find-file-hook)
;;(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))

(global-linum-mode t)
;;(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-l") 'mc/edit-lines)
;;(require 'saveplace)
(setq save-place-file (concat user-emacs-directory "saveplace.el"))
(setq-default save-place t)

(electric-indent-mode t)
;;(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "M-<f2>") 'nv-speedbar-open-current-buffer-in-tree)
(global-set-key (kbd "<f8>") 'sr-speedbar-toggle)

(setq speedbar-show-unknown-files t) ; show all files
(setq speedbar-use-images nil) ; use text for buttons
(setq sr-speedbar-right-side t) ; put on left side

(move-text-default-bindings)

(require 'dired-x)

(require 'auto-complete-config)
(ac-config-default)

(global-set-key (kbd "<f6>") 'flycheck-mode)

;;(require 'expand-region)
;;(global-set-key (kbd "C-d") 'er/expand-region)

(global-set-key (kbd "C-j") 'emmet-expand-line)

;;(global-set-key (kbd "C-u") 'undo-only)
(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key [C-delete] 'kill-region)

(autopair-global-mode t)

(global-set-key (kbd "M-(") 'insert-pair)
(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
(global-set-key (kbd "M-'") 'insert-pair)

(global-set-key (kbd "M-)") 'delete-pair)
(global-set-key (kbd "M-]") 'delete-pair)
(global-set-key (kbd "M-}") 'delete-pair)


(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x p") 'helm-projectile-find-file-in-known-projects)
(global-set-key (kbd "C-c o p") 'helm-projectile-switch-project)
;;(global-set-key (kbd "C-c p p") 'helm-projectile)


(global-set-key (kbd "C-c r") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c l") 'comment-line)

(require 'highlight-symbol)
(global-set-key [(meta f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(control f3)] 'highlight-symbol-query-replace)

(yas-global-mode 1)

;;(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; (add-to-list 'auto-mode-alist '("\\.ftl\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.ftl\\'" . (lambda()
                                                (web-mode)
                                                (make-local-variable 'comment-start)
                                                (make-local-variable 'comment-end)
                                                (setq comment-start "<#--")
                                                (setq comment-end "-->"))))




(add-to-list 'auto-mode-alist '("\\.ftd\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;(add-hook 'web-mode-hook 'js2-minor-mode)

;;(add-hook 'web-mode-hook 'html-mode)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-current-element-highlight-face t)

(projectile-global-mode)
(global-set-key (kbd "C-c h") 'helm-projectile)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-S-c SPC") ' ace-jump-line-mode)

;;(set-frame-font "Source Code Pro-10")
(set-frame-font "Monaco-9")

(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (menu-bar-mode -1))

;; Duplicate line and region
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))


(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))
(global-set-key (kbd "C-S-d") 'duplicate-current-line-or-region)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(fci-rule-color "#003f8e")
 '(speedbar-default-position (quote right))
 '(speedbar-frame-parameters
   (quote
    ((minibuffer)
     (width . 40)
     (border-width . 0)
     (menu-bar-lines . 0)
     (tool-bar-lines . 0)
     (unsplittable . t)
     (left-fringe . 0))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff9da4")
     (40 . "#ffc58f")
     (60 . "#ffeead")
     (80 . "#d1f1a9")
     (100 . "#99ffff")
     (120 . "#bbdaff")
     (140 . "#ebbbff")
     (160 . "#ff9da4")
     (180 . "#ffc58f")
     (200 . "#ffeead")
     (220 . "#d1f1a9")
     (240 . "#99ffff")
     (260 . "#bbdaff")
     (280 . "#ebbbff")
     (300 . "#ff9da4")
     (320 . "#ffc58f")
     (340 . "#ffeead")
     (360 . "#d1f1a9"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
