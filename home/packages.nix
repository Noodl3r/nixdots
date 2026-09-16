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
    unclutter-xfixes
    dmenu
    fzf
    jq
    i3-auto-layout
    typst
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
    # Unfree trash
    discord
    spotify
    google-chrome
    jetbrains.idea

    # Inkscape with it's textext extension
    (inkscape-with-extensions.override {
      inkscapeExtensions = with inkscape-extensions; [textext];
    })
  ];
}
