{pkgs, ...}: {
  home.packages = with pkgs; [
    vim-full
    helix
    curl
    wget
    xclip
    git
    lazygit
    gh
    kitty
    picom
    feh
    unclutter
    i3-auto-layout
    dmenu
    fzf
    jq
    # utilities
    flameshot
    zathura
    bunnyfetch
    mpv
    smartmontools
    multimarkdown
    entr
    tor-browser
    qbittorrent
    # Unfree trash
    discord
    spotify
  ];
}
