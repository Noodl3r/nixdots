{ pkgs, ... }: {
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
    unclutter-xfixes
    dmenu
    fzf
    jq
    i3-auto-layout
    typst
    typstyle
    # utilities
    flameshot
    gimp
    btop
    bunnyfetch
    mpv
    smartmontools
    multimarkdown
    entr
    tor-browser
    qbittorrent
    poppler-utils
    qemu
    wireshark
    weechat
    autotiling
    ispell
    nixd
    nixfmt

    # Unfree trash
    discord
    spotify
    google-chrome
    zoom

  ];
}
