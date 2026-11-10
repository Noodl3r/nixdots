;; Font configuration
(setq doom-font
      (font-spec :family "JetBrainsMono Nerd Font Mono"
                 :size 22
                 :weight 'regular))

;; Potential themes : modus-vivendi, ir-black, haki
(setq doom-theme 'haki)

(setq select-enable-clipboard t)
(setq select-enable-primary t)
(setq evil-want-fine-undo t)


;; Line numbers :
(setq display-line-numbers-type 'relative)
;; I hate the indacator at the bottom
(setq-default indicate-empty-lines nil)

;; Whitespace :
(setq whitespace-style '(face indentation trailing lines-tail))
;; (global-whitespace-mode t) slow?

;; Removing stupid splash on start up:
(remove-hook '+dashboard-functions #'+dashboard-widget-banner)

;; Reloading changes from outside emacs.
(global-auto-revert-mode 1)

;; Turning off the highlighting of the line
(global-hl-line-mode 0)

;; I like line wrapping :(
(add-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'prog-mode-hook #'visual-line-mode)

;; cursor positons between sessions / other similar stuff
(save-place-mode 1)
(recentf-mode 1)
(savehist-mode 1)
(setq scroll-margin 6
      scroll-conservatively 101
      scroll-preserve-screen-position t)

;; Whitespace :
(add-hook 'before-save-hook #'delete-trailing-whitespace)
;; Fixing the stupid i3 problem
(add-hook 'window-size-change-functions
          (lambda (frame)
            (redraw-frame frame)))

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
;; The arrow thing I enjoy
(map! :nvi "<down>" #'evil-next-visual-line
      :nvi "<up>"   #'evil-previous-visual-line)
(map! :nvi "C-l"  #'flyspell-auto-correct-previous-word)

;; Patching for gcc etc.
(after! eglot
  (setq eglot-send-changes-idle-time 0.5)
  (add-to-list 'eglot-server-programs
               '((c-mode c-ts-mode c++-mode c++-ts-mode)
                 . ("clangd"
                    "--query-driver=/nix/store/*-clang-wrapper-*/bin/clang,
           /nix/store/*-gcc-wrapper-*/bin/gcc,/nix/store/*-gcc-wrapper-*/bin/g++"))))

;; Company config
(after! company
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 1
        company-tooltip-limit 5
        company-selection-wrap-around t))


;; Projectile
(after! projectile
  (setq projectile-enable-caching t)
  (setq projectile-switch-project-action #'projectile-dired))
)

;; Compilation stuff
(setq compilation-scroll-output 'first-error)
(setq compilation-ask-about-save nil)

;; Getting emacs to just close
(setq confirm-kill-emacs nil)

;; Magit stuff
(setq magit-prefer-remote-upstream t)
(setq forge-topic-list-limit '(30 . 6))


;; Making vim s/S work normally instead of the weird snipe thing
(after! evil-snipe
  (evil-snip-mode -1))


;; Making ElDoc shutup
;;Keep ElDoc strictly to a single line in the minibuffer
(setq eldoc-echo-area-use-multiline-p nil)
(setq eldoc-idle-delay 0.3)
(setq lsp-idle-delay 0.2)
