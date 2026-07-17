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
    #dev
    #gcc
    gdb
    clang
    clang-tools
    valgrind
    cmake
    gnumake
    pkg-config
    lld
    ninja
    # languages
    python3
    rustc
    cargo
    rust-analyzer
    rustfmt
    clippy
    nodejs
    typst
    opam
    ocaml
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
