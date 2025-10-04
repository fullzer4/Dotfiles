{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "fullzer4";
    userEmail = "gabrielpelizzaro@gmail.com";
  };
}
