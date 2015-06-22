;; -------------------------- basic settings --------------------- 
;; Emacs24 compatible problem
(unless (boundp 'x-max-tooltip-size)
  (setq x-max-tooltip-size '(80 . 40))) 
;; y/n replace yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;; line number
(global-linum-mode 'linum-mode)
(global-set-key (kbd "RET") 'newline-and-indent)
;; kill ring size & column number & show parenthesis
(setq kill-ring-max 200)
(setq column-number-mode t)
(show-paren-mode t)
;; tab width 4
(setq c-basic-offset 4)
;; no # file
(setq auto-save-default nil)
;; no bell noise
(setq visible-bell t)
;; ecb error control
(setq stack-trace-on-error nil)
;; -------------------------- end ---------------------------------

;; -------------------------- global key bind ---------------------
;; f1        -- code block hide/show
;; f2        -- change to other window
;; f3        -- split window vertically
;; f4        -- split window horizontally
;; f5        -- delete current window 
;; f6        -- open/close speedbar
;; f7        -- ecb back to edit window
;; f8        -- 
;; f9        -- hide/show menu bar
;; C-c left  -- ecb directories
;; C-c down  -- ecb sources
;; C-c up    -- ecb methods
;; C-c right -- ecb history
(global-set-key [f1] 'hs-toggle-hiding)
(global-set-key [f2] 'other-window)
(global-set-key [f3] 'split-window-vertically)
(global-set-key [f4] 'split-window-horizontally)
(global-set-key [f5] 'delete-window)
(global-set-key [f6] 'speedbar-get-focus)
(global-set-key [f7] 'ecb-goto-window-edit1)
(global-set-key [f9] 'menu-bar-mode)
(global-set-key (kbd "C-c <left>") 'ecb-goto-window-directories)
(global-set-key (kbd "C-c <down>") 'ecb-goto-window-sources)
(global-set-key (kbd "C-c <up>") 'ecb-goto-window-methods)
(global-set-key (kbd "C-c <right>") 'ecb-goto-window-history)
;; -------------------------- end ---------------------------------

;; -------------------------- code block hide/show ----------------
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;; ------------------------- end ----------------------------------

;; ------------------------- Expand-region settings ---------------
(add-to-list 'load-path "~/.emacs.d/elpa/expand-region")
(require 'expand-region)
(global-set-key (kbd "M-=") 'er/expand-region)
;; ------------------------- end ----------------------------------

;; ------------------------- Color Theme settings -----------------
;(add-to-list 'load-path "~/.emacs.d/elpa/color-theme/")
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-calm-forest)
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/monokai")
(load-theme 'monokai t)
;; ------------------------- end ----------------------------------

;; ------------------------- CEDET settings -----------------------
(load-file "~/.emacs.d/elpa/cedet/common/cedet.el")
(global-ede-mode 1)
(global-srecode-minor-mode 1)
(semantic-load-enable-code-helpers)
(require 'semantic-ia)
(require 'semantic-gcc)
(global-semantic-idle-completions-mode)
(global-semantic-highlight-edits-mode (if window-system 1 -1))
(global-semantic-idle-local-symbol-highlight-mode)
(defun auto-c-mode-cedet-hook()
  (local-set-key (kbd "M-/") 'semantic-ia-complete-symbol)
  (local-set-key (kbd "M-n") 'semantic-complete-analyze-inline)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'auto-c-mode-cedet-hook)
(defconst gpudir "~/Documents/gpgpu-sim_distribution/src/")
(defconst osdir "/usr/include")
(defconst cedet-user-include-dirs
  (list gpudir
	(concat gpudir "cuda-sim")
	(concat gpudir "cuda-sim/decuda_pred_table")
	(concat gpudir "gpgpu-sim")
	(concat gpudir "gpuwattch")
	(concat gpudir "gpuwattch/cacti")
	(concat gpudir "intersim2")
	(concat gpudir "intersim2/allocators")
	(concat gpudir "intersim2/arbiters")
	(concat gpudir "intersim2/networks")
	(concat gpudir "intersim2/power")
	(concat gpudir "intersim2/routers")))
(setq cedet-sys-include-dirs
      (list osdir
	    (concat osdir "/bits")
	    (concat osdir "/c++")
	    (concat osdir "/sys")))
(let ((include-dirs cedet-user-include-dirs))
  (setq include-dirs (append include-dirs cedet-sys-include-dirs))
  (mapc (lambda (dir)
	  (semantic-add-system-include dir 'c++-mode)
	  (semantic-add-system-include dir 'c-mode))
	include-dirs))
;; ------------------------- end ----------------------------------

;; ------------------------- ECB settings -------------------------
(add-to-list 'load-path "~/.emacs.d/elpa/ecb/")
(require 'ecb)
(setq ecb-auto-compatibility-check nil)
(setq ecb-tip-of-the-day nil)
(setq ecb-windows-width 0.20)
(setq ecb-layout-name "leftright2")
(ecb-activate)
;; ------------------------- end ----------------------------------

(add-to-list 'load-path "~/.emacs.d/elpa/multiple-cursors/")
(require 'multiple-cursors)
(global-set-key (kbd "C-'") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-|") 'mc/mark-all-like-this)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-source-path
   (quote
    (("~/.emacs.d/" ".emacs.d")
     ("~/Documents/gpgpu-sim_distribution/" "gpgpu-sim")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

