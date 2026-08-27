{
  home.file = {
    ".local/bin".source = ../scripts;
    ".config/i3".source = ../config/i3;
    ".config/i3status".source = ../config/i3status;
    ".config/kitty".source = ../config/kitty;
    ".config/picom".source = ../config/picom;
    ".vim" = {
      source = ../config/vim;
      recursive = true;
    };
  };
}
