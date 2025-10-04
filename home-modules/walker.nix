{ config, pkgs, colors, ... }:

{
  # Walker - Advanced launcher (Omarchy-style)
  # Note: walker-bin may need to be added to nixpkgs or use an overlay
  # For now, keeping fuzzel as fallback
  
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        lines = 10;
        width = 30;
        layer = "overlay";
        border-width = 2;
        border-radius = 8;
        dpi-aware = "auto";
        terminal = "ghostty";
      };
      colors = {
        background       = "${builtins.substring 1 6 colors.bgAlt}dd";
        text             = "${builtins.substring 1 6 colors.fg}ff";
        input            = "${builtins.substring 1 6 colors.fg}ff";
        selection        = "${builtins.substring 1 6 colors.accent}ff";
        selection-text   = "${builtins.substring 1 6 colors.bg}ff";
        border           = "${builtins.substring 1 6 colors.accent}ff";
        match            = "${builtins.substring 1 6 colors.accentAlt}ff";
        selection-match  = "${builtins.substring 1 6 colors.accentAlt}ff";
      };
    };
  };
  
  # TODO: Add walker when available in nixpkgs
  # home.packages = with pkgs; [ walker ];
}
