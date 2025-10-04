{ config, pkgs, colors, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 5;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "${config.home.homeDirectory}/Pictures/Wallpapers/mountain.jpg";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "300, 60";
          position = "0, -150";
          monitor = "";
          dots_center = true;
          dots_spacing = 0.3;
          dots_rounding = -1;
          fade_on_empty = false;
          fade_timeout = 1000;
          font_color = "rgb(${builtins.substring 1 6 colors.fg})";
          inner_color = "rgba(${builtins.substring 1 6 colors.bgAlt}ee)";
          outer_color = "rgba(${builtins.substring 1 6 colors.accent}ff)";
          outline_thickness = 3;
          placeholder_text = "<span foreground='##${builtins.substring 1 6 colors.fg}'>   Enter Password...</span>";
          shadow_passes = 2;
          shadow_size = 3;
          shadow_color = "rgba(0, 0, 0, 0.8)";
          check_color = "rgb(${builtins.substring 1 6 colors.accentAlt})";
          fail_color = "rgb(${builtins.substring 1 6 colors.warn})";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgb(${builtins.substring 1 6 colors.warn})";
          rounding = 12;
        }
      ];

      label = [
        # Time
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b>$(date +\"%H:%M\")</b>\"";
          color = "rgb(${builtins.substring 1 6 colors.fg})";
          font_size = 120;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 300";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 5;
          shadow_color = "rgba(0, 0, 0, 0.5)";
        }
        # Date
        {
          monitor = "";
          text = "cmd[update:60000] echo \"$(date +'%A, %d de %B de %Y')\"";
          color = "rgb(${builtins.substring 1 6 colors.fg})";
          font_size = 28;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 180";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 3;
          shadow_color = "rgba(0, 0, 0, 0.5)";
        }
        # User
        {
          monitor = "";
          text = "$USER";
          color = "rgb(${builtins.substring 1 6 colors.fg})";
          font_size = 24;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 0";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 3;
          shadow_color = "rgba(0, 0, 0, 0.5)";
        }
      ];
    };
  };
}
