;; Font configuration 
(setq doom-font
    (font-spec :family "JetBrainsMono Nerd Font Mono"
       :size 20
       :weight 'regular))

;; Potential themes : modus-vivendi, ir-black
(setq doom-theme 'modus-vivendi)

(setq select-enable-clipboard t)
(setq select-enable-primary t)


;; Line numbers :
(setq display-line-numbers-type 'relative)

;; Reloading changes from outside emacs.
(global-auto-revert-mode 1)

;; Dired for oil like effect
(map! :leader "TAB" #'dired-jump)
;; The leader save I'm used to from vim
(map! :leader "w" #'save-buffer)

