{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  
  users.users.fullzer4 = {
    isNormalUser = true;
    description = "fullzer4";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "docker" "kvm"];
    packages = with pkgs; [];
  };
}
