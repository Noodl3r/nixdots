{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/nvf.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 15;

  networking.hostName = "Multivac"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";
  services = {
    openssh.enable = true;
    displayManager.ly.enable = true;
    xserver = {
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      windowManager.i3.enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_MAX_PERF_ON_BAT = 80;
      };
    };
  };
  security.rtkit.enable = true;

  users.users.noodl3 = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = ["wheel" "networkmanager" "video" "audio" "input" "storage" "disk"];
    packages = with pkgs; [
      tree
    ];
  };
  programs = {
    firefox.enable = true;
    fish.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim-full
    helix
    curl
    wget
    fd
    xclip
    git
    lazygit
    gh
    kitty
    picom
    feh
    brightnessctl
    pulseaudio
    unclutter
    i3-auto-layout
    fish
    fzf
    dmenu
    ripgrep
    bat
    zip
    unzip
    xz
    p7zip
    #dev
    gcc
    gdb
    clang
    clang-tools
    valgrind
    cmake
    gnumake
    pkg-config
    lld
    ninja
    opam
    ocaml
    # languages
    python3
    rustc
    cargo
    rust-analyzer
    rustfmt
    clippy
    nodejs
    typst
    # utilities
    flameshot
    zathura
    bunnyfetch
    mpv
    smartmontools
    multimarkdown
    entr
    #Unfree trash
    discord
    spotify
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  hardware = {
    bluetooth.enable = true;
  };
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    keep-outputs = true;
    keep-derivations = true;
  };

  system.stateVersion = "26.05";
}
