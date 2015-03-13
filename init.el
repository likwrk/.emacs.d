;; (require 'package)
;; (package-initialize)
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives
;;              '("org" . "http://orgmode.org/elpa/") t)

(require 'cask "~/.emacs.d/cask/cask.el")
(cask-initialize)

(global-visual-line-mode t)
(delete-selection-mode -1)
(blink-cursor-mode 1)

(show-paren-mode t)
(setq show-paren-delay 0)

(desktop-save-mode -1)

(defvar --backup-directory (concat user-emacs-directory "saves"))
(setq backup-directory-alist  `(("." . ,--backup-directory )))
(setq make-backup-file nil)
(setq auto-save-default nil)
(setq make-auto-save-file-name nil)
(setq auto-save-mode -1)

(setq inhibit-startup-message -1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)

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

(require 'auto-complete-config)
(ac-config-default)

;;(require 'expand-region)
(global-set-key (kbd "C-d") 'er/expand-region)

(global-set-key (kbd "C-j") 'emmet-expand-line)

(global-set-key (kbd "C-u") 'undo-only)
(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "M-(") 'insert-pair)
(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
(global-set-key (kbd "M-'") 'insert-pair)

(global-set-key (kbd "M-)") 'delete-pair)
(global-set-key (kbd "M-]") 'delete-pair)
(global-set-key (kbd "M-}") 'delete-pair)

;;(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ftl\\'" . web-mode))
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


(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))
(global-set-key (kbd "C-S-d") 'duplicate-line)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
