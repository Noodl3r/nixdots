{ config, lib, pkgs, ... }:

{
    imports =
        [ 
        ./hardware-configuration.nix
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
        extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" "storage" "disk" ]; 
        packages = with pkgs; [
            tree
        ];
    };

    programs.firefox.enable = true;
    programs.fish.enable = true;

    environment.systemPackages = with pkgs; [
        vim-full
        xclip
        curl
        wget
        git 
        helix
        kitty
        picom
        feh
        brightnessctl
        unclutter
        tmux
        fish
        fzf
        dmenu
        ripgrep
        bat
        zip
        unzip
        #dev
        gcc
        gdb
        clang
        valgrind
        cmake
        gnumake
        pkg-config
        flameshot
        impala
        lazygit
    ];

    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
    ];

    hardware = {
        bluetooth.enable = true;
    };
    nix.settings = {
      experimental-features = [ "nix-command" "flakes"];
      auto-optimise-store = true;
      keep-outputs = true;
      keep-derivations = true;
    };

    system.stateVersion = "26.05"; 
}
