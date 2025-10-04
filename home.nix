{ config, pkgs, ... }:

{
  imports = [
    ./home-modules/colors.nix
    ./home-modules/packages.nix
    ./home-modules/hyprland.nix
    ./home-modules/waybar.nix
    ./home-modules/applications.nix
    ./home-modules/git.nix
    ./home-modules/walker.nix
    ./home-modules/hyprlock.nix
    ./home-modules/hypridle.nix
    ./home-modules/zsh.nix
    ./home-modules/thunar.nix
  ];

  home.username      = "fullzer4";
  home.homeDirectory = "/home/fullzer4";
  home.stateVersion  = "25.05";
  
  programs.home-manager.enable = true;
}
