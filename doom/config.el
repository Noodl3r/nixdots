;; Font configuration
(setq doom-font
      (font-spec :family "JetBrainsMono Nerd Font Mono"
                 :size 22
                 :weight 'regular))

;; Potential themes : modus-vivendi, ir-black, haki
(setq doom-theme 'haki)

(setq select-enable-clipboard t)
(setq select-enable-primary t)


;; Line numbers :
(setq display-line-numbers-type 'relative)

;; Reloading changes from outside emacs.
(global-auto-revert-mode 1)

;; Turning off the highlighting of the line
(global-hl-line-mode 0)

;; cursor positons between sessions / other similar stuff
(save-place-mode 1)
(recentf-mode 1)
(savehist-mode 1)
(setq scroll-margin 6
      scroll-conservatively 101
      scroll-preserve-screen-position t)

;; Whitespace :
(add-hook 'before-save-hook #'delete-trailing-whitespace)

;; Window stuff.
(winner-mode 1)
(after! evil
  (setq evil-split-window-below t
        evil-vsplit-window-right t))

;; The leader save I'm used to from vim
(map! :leader "W" #'save-buffer)
;; Deleting windows
(map! :leader
      "w x" #'delete-window
      "w d" nil)


;; Patching for gcc etc.
(after! eglot
  (setq eglot-send-changes-idle-time 1.0)
  (add-to-list 'eglot-server-programs
               '((c-mode c-ts-mode c++-mode c++-ts-mode)
                 . ("clangd"
                    "--query-driver=/nix/store/*-clang-wrapper-*/bin/clang,
           /nix/store/*-gcc-wrapper-*/bin/gcc,/nix/store/*-gcc-wrapper-*/bin/g++"))))

;; Company config
(after! company
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-tooltip-limit 8
        company-selection-wrap-around t))


;; Projectile
(after! projectile
  (setq projectile-enable-caching t)
  (setq projectile-switch-project-action #'projectile-dired))
)

;; Compilation stuff
(setq compilation-scroll-output 'first-error)
(setq compilation-ask-about-save nil)
