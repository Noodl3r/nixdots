(setq doom-font
      (font-spec :family "Iosevka Comfy"
                 :size 24
                 :weight 'regular))

;; Fallback font for missing Unicode glyphs
(set-fontset-font t 'unicode
                  (font-spec :family "JetBrainsMono Nerd Font")
                  nil 'append)

;; Setup stuff
(require 'server)
(unless (server-running-p)
  (server-start))



;; Potential themes : modus-vivendi, ir-black, haki
(setq doom-theme 'temple-dark)

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

;; Turning off the highlighting of the line via fighting with
(global-hl-line-mode -1)
(setq hl-line-mode nil)
(add-hook 'after-change-major-mode-hook
          (lambda () (hl-line-mode -1)))
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)
(remove-hook 'after-change-major-mode-hook
             #'global-hl-line-mode-enable-in-buffer)


;; I like line wrapping :(
(add-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'flyspell-mode)
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
(map! :ni "C-l"  #'flyspell-auto-correct-previous-word)

;; Patching for gcc etc.
(after! eglot
  (setq eglot-send-changes-idle-time 0.5)
  (add-to-list 'eglot-server-programs
               '((c-mode c-ts-mode c++-mode c++-ts-mode)
                 . ("clangd"
                    "--query-driver=/nix/store/*-clang-wrapper-*/bin/clang,
           /nix/store/*-gcc-wrapper-*/bin/gcc,/nix/store/*-gcc-wrapper-*/bin/g++"))))

;; Patching for java stupidity
(after! eglot
  (add-to-list 'eglot-server-programs
               '((java-mode java-ts-mode) . ("jdtls")))

  (add-hook 'java-mode-hook #'eglot-ensure)
  (add-hook 'java-ts-mode-hook #'eglot-ensure))

;; Typst: syntax coloring (tree-sitter), no LSP. typstyle handles
;; (format +onsave) via apheleia.
;; Live preview: `typst watch' runs in a compilation buffer (doom pops it
;; up at the bottom, errors stay visible, `g' restarts it) and the pdf
;; opens in a right split where auto-revert refreshes it on each rebuild.
(use-package! typst-ts-mode
  :mode "\\.typ\\'")

(defun +typst--file (&optional file)
  "FILE, or the current buffer's .typ file, or ask."
  (or file
      (and buffer-file-name (string-suffix-p ".typ" buffer-file-name)
           buffer-file-name)
      (read-file-name "Typst file: " nil nil t nil
                      (lambda (f) (or (file-directory-p f)
                                      (string-suffix-p ".typ" f))))))

(defun +typst/watch (&optional file)
  "Start (or restart) `typst watch' on FILE (default: current .typ file).
Runs in the file's own directory, so imports relative to it resolve."
  (interactive)
  (let* ((file (+typst--file file))
         (default-directory (file-name-directory file))
         (buf-name (format "*typst watch: %s*" (file-name-nondirectory file)))
         (compilation-buffer-name-function (lambda (_) buf-name)))
    (when-let* ((buf (get-buffer buf-name)))
      (when-let* ((proc (get-buffer-process buf)))
        (delete-process proc))
      (kill-buffer buf))
    (compilation-start (format "typst watch %s" (shell-quote-argument file)))))

(defun +typst/preview (&optional file)
  "Run `+typst/watch' on FILE and open its pdf in a right-side split."
  (interactive)
  (let* ((file (+typst--file file))
         (pdf (concat (file-name-sans-extension file) ".pdf")))
    ;; one synchronous compile so the pdf exists right away
    (unless (file-exists-p pdf)
      (call-process "typst" nil nil nil "compile" file pdf))
    (+typst/watch file)
    (if (file-exists-p pdf)
        (display-buffer (find-file-noselect pdf)
                        '(display-buffer-in-side-window . ((side . right)
                                                           (window-width . 0.5))))
      (message "+typst: no pdf yet -- check the watch buffer for errors"))))

(map! :leader
      :desc "typst watch + pdf split" "o h" #'+typst/preview)
(map! :after typst-ts-mode
      :map typst-ts-mode-map
      :localleader
      :desc "typst watch"       "c" #'+typst/watch
      :desc "pdf split preview" "r" #'+typst/preview)

;; Lsp speed up thing
(setq read-process-output-max (* 1024 1024))

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
;; pdf-tools
(after! pdf-tools
  (add-hook 'pdf-view-mode-hook #'auto-revert-mode))

;; Compilation stuff
(setq compilation-scroll-output 'first-error)
(setq compilation-ask-about-save nil)

;; Getting emacs to just close
(setq confirm-kill-emacs nil)

;; Magit stuff
(setq magit-prefer-remote-upstream t)
(setq forge-topic-list-limit '(30 . 6))




;; Fixing vterm stuff
(after! vterm
  (setq vterm-keymap-exceptions
        '("C-c" "C-x" "C-u" "C-g" "C-l")))
