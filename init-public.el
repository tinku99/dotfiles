;; improve slow performance on windows.
(setq w32-get-true-file-attributes nil)
;; faster startup with emacsclient -c 
(server-start)

(setq computername (getenv "COMPUTERNAME"))
      
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(org-startup-indented t))
;; Font size
(set-face-attribute 'default nil :height 200)
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(show-paren-mode t)
(setq make-backup-files nil)

(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/evil")
(add-hook 'emacs-lisp-mode-hook #'folding-mode)
(require 'ahk-org-mode)

(load "folding")

(require 'evil)
(evil-mode 1)

(setq evil-overriding-maps nil)
(setq evil-intercept-maps nil)
(define-key evil-normal-state-map "eo" 'folding-show-current-subtree)
(define-key evil-normal-state-map "ec" 'folding-hide-current-subtree)
(define-key evil-normal-state-map "es" 'save-buffer) 
(define-key evil-normal-state-map "ee" 'evil-end-of-line)
(define-key evil-normal-state-map "ek" 'kill-buffer)
(define-key evil-normal-state-map "el" 'org-open-at-point)

(define-key evil-normal-state-map "9" 'evil-end-of-line)


(define-key evil-normal-state-map "s" nil)
(define-key evil-motion-state-map "s" nil)
(define-key evil-normal-state-map "t" nil)
(define-key evil-motion-state-map "t" nil)
(define-key evil-motion-state-map " " nil)

(define-key evil-motion-state-map (kbd "SPC h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "SPC j") 'evil-window-down)
(define-key evil-motion-state-map (kbd "SPC k") 'evil-window-up)
(define-key evil-motion-state-map (kbd "SPC l") 'evil-window-right)
 
(define-key evil-motion-state-map "su" 'universal-argument)
(define-key evil-motion-state-map "tu" 'universal-argument)
(define-key evil-normal-state-map "to" 'other-window)
(define-key evil-normal-state-map "tb" 'switch-to-buffer)
(define-key evil-normal-state-map "te" 'eval-last-sexp)
(define-key evil-normal-state-map "tl" 'org-open-at-point)
(define-key evil-normal-state-map "tk" 'kill-buffer)

(define-key evil-normal-state-map "t|" 'org-table-create)

(define-key evil-normal-state-map "t/" 'replace-regexp)
(define-key evil-normal-state-map "t1" 'delete-other-windows)

(define-key evil-normal-state-map "tf" 'find-file)

(define-key evil-normal-state-map "t\d" 'pop-global-mark)


(defun evil-undefine ()
 (interactive)
 (let (evil-mode-map-alist)
   (call-interactively (key-binding (this-command-keys)))))


(define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)
(define-key evil-normal-state-map (kbd "TAB") 'folding-toggle-show-hide)

;; http://stackoverflow.com/questions/8483182/evil-mode-best-practice

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)


(ido-mode t)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

					; M-x load-file auto-complete/etc/install.el
					; chose a:/hotkey/dotfiles/vendor

(require 'auto-complete-config)
(ac-config-default)

(autoload 'ahk-org-mode "ahk-org-mode")
(add-to-list 'auto-mode-alist '("\\.ahk$" . ahk-org-mode))

(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))

(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'ahk-org-mode)
(setq make-backup-files nil) 
(defalias 'yes-or-no-p 'y-or-n-p)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
