(doom! :completion
       (company +childframe)
       vertico

       :ui
       doom
       dashboard
       modeline
       nav-flash
       ophints
       (popup +all +defaults)
       window-select
       vc-gutter
       workspaces
       indent-guides

       :editor
       (evil +everywhere)
       (format +onsave)
       multiple-cursors
       word-wrap

       :emacs
       undo
       (dired +dirvish)

       :checkers
       syntax
       (spell +flyspell)
       grammar

       :term
       vterm

       :os
       (:if (featurep :system 'macos) macos)
       (tty +osc)

       :lang
       emacs-lisp
       (cc +lsp +tree-sitter)
       (go +lsp)
       (java +lsp +meghanada)
       markdown
       (python +lsp)
       (sh +lsp)
       lean

       (:if (featurep 'unstraightened) (nix +lsp))

       :tools
       direnv
       magit
       (lsp +eglot)


       :config
       (default +bindings +smartparens))
