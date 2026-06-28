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

  networking.hostName = "Multivac"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  services.displayManager.ly.enable = true;
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.i3.enable = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_MAX_PERF_ON_BAT = 80;
    };
  };

  users.users.noodl3 = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "video" "audio" "input" "storage" "disk"];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim-full
    helix
    xclip
    curl
    wget
    git
    lazygit
    gh
    kitty
    picom
    feh
    brightnessctl
    pulseaudio
    unclutter
    tmux
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

    #Unfree trash
    discord
    spotify
    fd
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
