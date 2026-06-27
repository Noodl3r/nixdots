{ config, pkgs, ...}:

{
  home.username = "noodl3";
  home.homeDirectory = "/home/noodl3";
  home.stateVersion ="25.05";

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
            set fish_greeting #Disable greeting;
    '';
    shellAliases = {
      btw = "echo I use nixos btw";
      v = "vim";
      rebuild ="sudo nixos-rebuild switch --flake ~/nixos-dotfiles#multivac";
    };
  };
  programs.git = {
    enable = true;
    settings.user.name  = "Noodl3r";
    settings.user.email = "echelon.r6s@gmail.com";
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

  home.file.".config/i3".source       = ./config/i3;
  home.file.".config/i3status".source = ./config/i3status;
  home.file.".config/kitty".source    = ./config/kitty;
  home.file.".config/picom".source    = ./config/picom;
  home.file.".config/tmux".source     = ./config/tmux;
  home.file.".vimrc".source           = ./config/vim/vimrc;
}
