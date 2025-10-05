{ config, pkgs, colors, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "OneHalfDark";
      background = colors.bg;
      foreground = colors.fg;
      cursor-color = colors.accentAlt;
      selection-background = colors.accentAlt;
      selection-foreground = colors.bg;
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;
      shell-integration = "zsh";
    };
  };

  services.mako = {
    enable = true;
    extraConfig = ''
      [urgency=high]
      background-color=${colors.warn}
      text-color=${colors.bg}
      border-color=${colors.warn}
    '';
    settings = {
      font = "JetBrainsMono Nerd Font 12";
      background-color = colors.bgAlt;
      text-color = colors.fg;
      border-color = colors.accent;
      border-size = 2;
      border-radius = 8;
      padding = "8";
      default-timeout = 5000;
    };
  };
  
  services.swayosd = {
    enable = true;
    topMargin = 0.9;
  };
  
  services.cliphist.enable = true;
}
