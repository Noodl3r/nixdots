{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "noodl3";
    homeDirectory = "/home/noodl3";
    stateVersion = "25.05";
    sessionVariables = {
      DIRENV_LOG_FORMAT = "";
    };
    file = {
      ".local/bin".source = ./scripts;
      ".config/i3".source = ./config/i3;
      ".config/i3status".source = ./config/i3status;
      ".config/kitty".source = ./config/kitty;
      ".config/picom".source = ./config/picom;
      ".vimrc".source = ./config/vim/vimrc;
    };
  };
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
        fish_add_path ~/.local/bin
        set -g fish_key_bindings fish_vi_key_bindings
        set -f fish_cursor_default block blink
        set -f fish_cursor_insert line blink
        set -f fish_cursor_replace_one underscore blink
        set -f fish_cursor_visual block
        set -gx DIRENV_LOG_FORMAT ""
      '';

      shellAliases = {
        btw = "echo I use nixos btw";
        v = "nvim";
        rebuild = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#multivac --no-reexec";
        check = "nix flake check ~/nixos-dotfiles";
        lg = "lazygit";
      };
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = ["--cmd cd"];
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      config = {
        global = {
          # Hides block
          hide_env_diff = true;
          # Silence everything
          # log_format = "-";
        };
      };
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        add_newline = true;
        character = {
          success_symbol = "[ξ](bold cyan)";
          error_symbol = "[ξ](bold red)";
          vimcmd_symbol = "[ξ](bold cyan)";
        };
      };
    };

    git = {
      enable = true;
      settings.user.name = "Noodl3r";
      settings.user.email = "echelon.r6s@gmail.com";
    };

    tmux = {
      enable = true;
      shell = "${pkgs.fish}/bin/fish";
      clock24 = true;
      keyMode = "vi";
      terminal = "tmux-256color";
      shortcut = "a";
      baseIndex = 1;
      mouse = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        vim-tmux-navigator
        resurrect
        continuum
      ];
      # must be a better way to do this lol
      extraConfig = ''
        set -g status-position top
        set -g status on
        set -g status-left ""
        set -g status-right ""
        set -g status-style bg=#000000,fg=#000000
        set -g window-status-style fg=#6c7086,bg=#1e1e2e
        set -g window-status-current-style fg=#ff00ff,bold,bg=#000000
        set -g window-status-separator ""
        set -g window-status-format " #I "
        set -g window-status-current-format " #I "
        bind-key h select-pane -L
        bind-key j select-pane -D
        bind-key k select-pane -U
        bind-key l select-pane -R

        set-option -g set-clipboard on
        bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -in"
        bind-key e display-popup -E -w 80% -h 80% "ts"
      '';
    };

    firefox = {
      enable = true;
      configPath = ".mozilla/firefox";
      profiles.default = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.compactmode.show" = true;
        };
        userChrome = builtins.readFile ./config/firefox/userChrome.css;
      };
    };
  };

  services.screen-locker = {
    enable = true;
    lockCmd = "${pkgs.i3lock}/bin/i3lock -n -c 000000";
    inactiveInterval = 5;
    xautolock.enable = true;
  };
}
