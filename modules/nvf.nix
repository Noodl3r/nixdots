{...}: {
  programs.nvf = {
    enable = true;
    # Your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings.vim = {
      globals.mapleader = " ";
      lineNumberMode = "relNumber";
      viAlias = true;
      vimAlias = false;
      autopairs.nvim-autopairs.enable = true;
      opts.expandtab = true;
      theme = {
        enable = true;
        name = "oxocarbon";
        style = "dark";
        transparent = false;
      };
      spellcheck = {
        enable = true;
      };
      lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = true;
        trouble.enable = true;
        otter-nvim.enable = true;
      };
      debugger = {
        nvim-dap = {
          enable = true;
          ui.enable = true;
        };
      };
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;
        clang.enable = true;
        cmake.enable = true;
        java.enable = true;
        python.enable = true;
        rust.enable = true;
        docker.enable = true;
        lua.enable = true;
      };
      diagnostics = {
        enable = true;
        nvim-lint.enable = true;
        config.virtual_text = true;
      };
      autocomplete = {
        blink-cmp.enable = true;
      };
      fzf-lua = {
        enable = true;
        profile = "borderless-full";
      };
      utility = {
        oil-nvim.enable = true;
        oil-nvim.gitStatus.enable = true;
        diffview-nvim.enable = true;
      };
      terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
        };
      };
      binds = {
        whichKey.enable = true;
      };
    };
  };
}
