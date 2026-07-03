# https://nvf.notashelf.dev/
{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    # Your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings.vim = {
      keymaps = import ./keymaps.nix;
      luaConfigPre = ''
        vim.opt.runtimepath:prepend("${./colors/oldschool}")
      '';
      globals.mapleader = " ";
      lineNumberMode = "relNumber";
      viAlias = true;
      vimAlias = false;
      autopairs.nvim-autopairs.enable = true;
      opts = {
        expandtab = true;
        tabstop = 4;
        shiftwidth = 4;
        signcolumn = "no";
        scrolloff = 6;
      };
      visuals = {
        rainbow-delimiters.enable = true;
        indent-blankline.enable = true;
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
        mappings = {
          codeAction = "<leader>ca";
          goToDeclaration = "<leader>gD";
          goToDefinition = "<leader>gd";
          goToType = "<leader>gt";
          nextDiagnostic = "<leader>n";
          previousDiagnostic = "<leader>N";
          renameSymbol = "<leader>gr";
        };
      };
      treesitter = {
        enable = true;
        #context.enable = true;
        highlight.enable = true;
        #indent.enable = true;
        autotagHtml = true;
      };
      #debugger = {
      #nvim-dap = {
      #enable = true;
      #ui.enable = true;
      #};
      #};
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
        typst = {
          enable = true;
          extensions.typst-preview-nvim.setupOpts = {
            invert_colors = "auto";
          };
        };
      };
      diagnostics = {
        enable = true;
        nvim-lint.enable = true;
        config.virtual_text = true;
      };
      autocomplete = {
        blink-cmp.enable = true;
      };
      telescope = {
        enable = true;
        mappings = {
          gitFiles = "<leader>ff";
          liveGrep = "<leader>fg";
          findProjects = "<leader>fd";
        };
      };
      utility = {
        oil-nvim.enable = true;
        oil-nvim.gitStatus.enable = true;
        diffview-nvim.enable = true;
        surround.enable = true;
      };
      ui = {
        borders.enable = true;
        colorizer.enable = true;
      };
      terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
        };
      };
      git = {
        enable = true;
      };
      luaConfigPost = ''
        vim.cmd.colorscheme("oldschool");
      '';
    };
  };
}
