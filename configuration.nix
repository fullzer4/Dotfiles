{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/hyprland.nix
    ./modules/audio.nix
    ./modules/users.nix
    ./modules/packages.nix
    ./modules/services.nix
    ./modules/virtualization.nix
    ./modules/locale.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  system.stateVersion = "25.05";
}

