;; -------------------------- basic settings --------------------- 
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

;; ------------------------- Color Theme settings -----------------
(add-to-list 'load-path "~/.emacs.d/elpa/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-calm-forest)
;; ------------------------- end ----------------------------------

;; ------------------------- Auto-complete settings --------------
(add-to-list 'load-path "~/.emacs.d/elpa/popup-el")
(add-to-list 'load-path "~/.emacs.d/elpa/autocomplete")
(require 'auto-complete-config)
(ac-config-default)
;; ------------------------- end ----------------------------------

;; ------------------------- CEDET settings -----------------------
(load-file "~/.emacs.d/elpa/cedet/common/cedet.el")
(global-ede-mode 1)
(semantic-load-enable-code-helpers)
(require 'semantic-ia)
(require 'semantic-gcc)
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
