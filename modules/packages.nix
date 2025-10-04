{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    htop
    neofetch
    pulseaudio
    pamixer
    postman
  ];

  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    pkgs.nerd-fonts.jetbrains-mono 
  ];
}
