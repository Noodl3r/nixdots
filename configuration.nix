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

  users.users.noodl3 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" "storage" "disk" ]; 
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  # programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git 
    helix
    kitty
    picom
    feh
    brightnessctl
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes"];
  system.stateVersion = "26.05"; 
}
