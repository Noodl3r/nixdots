{
  config,
  pkgs,
  ...
}: {
  home.username = "noodl3";
  home.homeDirectory = "/home/noodl3";
  home.stateVersion = "25.05";

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_add_path ~/.local/bin
      set -g fish_key_bindings fish_vi_key_bindings
      set -f fish_cursor_default block blink
      set -f fish_cursor_insert line blink
      set -f fish_cursor_replace_one underscore blink
      set -f fish_cursor_visual block
    '';

    shellAliases = {
      btw = "echo I use nixos btw";
      v = "nvim";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#multivac --no-reexec";
      check = "nix flake check ~/nixos-dotfiles";
      lg = "lazygit";
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = ["--cmd cd"];
  };

  programs.starship = {
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

  programs.git = {
    enable = true;
    settings.user.name = "Noodl3r";
    settings.user.email = "echelon.r6s@gmail.com";
  };

  services.screen-locker = {
    enable = true;
    lockCmd = "${pkgs.i3lock}/bin/i3lock -n -c 000000";
    inactiveInterval = 5;
    xautolock.enable = true;
  };

  programs.tmux = {
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
    '';
  };

  programs.firefox = {
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

  home.file.".local/bin".source = ./scripts;
  home.file.".config/i3".source = ./config/i3;
  home.file.".config/i3status".source = ./config/i3status;
  home.file.".config/kitty".source = ./config/kitty;
  home.file.".config/picom".source = ./config/picom;
  home.file.".vimrc".source = ./config/vim/vimrc;
}
