(doom! :completion
       vertico

       :ui
       doom
       dashboard
       modeline
       nav-flash
       ophints
       (popup +defaults)
       window-select

       :editor
       (evil +everywhere)

       :emacs
       undo
       dired

       :term
       eshell
       vterm

       :os
       (:if (featurep :system 'macos) macos)
       (tty +osc)

       :lang
       emacs-lisp
       (cc +lsp +tree-sitter)
       (:if (featurep 'unstraightened) (nix +lsp))

       :tools
       direnv
       magit
       (sh +lsp)
       (lsp +eglot)


       :config
       (default +bindings +smartparens))
