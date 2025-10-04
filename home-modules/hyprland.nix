{ config, pkgs, inputs, colors, ... }:

let
  wallpaperPath = "${config.home.homeDirectory}/Pictures/Wallpapers/mountain.jpg";
in
{
  home.file.".config/hypr/wallpapers/.keep".text = "";
  
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ wallpaperPath ];
      wallpaper = [ ",${wallpaperPath}" ];
      splash = false;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      monitor = ",preferred,auto,1";
      input.kb_layout = "us";
      input.follow_mouse = 1;
      input.touchpad.natural_scroll = false;

      general = {
        gaps_in = 6;
        gaps_out = 12;
        border_size = 2;
        "col.active_border" =
          "rgba(${builtins.substring 1 6 colors.accentAlt}${colors.alpha67}) "
          + "rgba(${builtins.substring 1 6 colors.accent}${colors.alpha67}) 45deg";
        "col.inactive_border" = "rgba(${builtins.substring 1 6 colors.bgAlt}88)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = { enabled = true; size = 3; passes = 1; };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(${builtins.substring 1 6 colors.shadow}dd)";
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows,    1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border,     1, 10, default"
          "borderangle,1, 8, default"
          "fade,       1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      bind = [
        "$mod, Return, exec, ghostty"
        "$mod, Q, killactive,"
        "$mod, M, exit,"
        "$mod, E, exec, thunar"
        "$mod, V, togglefloating,"
        "$mod, R, exec, fuzzel"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"
        "$mod, L, exec, hyprlock"
        "$mod, C, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
        
        # Screenshots (Omarchy-style)
        ", Print, exec, hyprshot -m output"
        "$mod, Print, exec, hyprshot -m window"
        "$mod SHIFT, Print, exec, hyprshot -m region"
        
        # Color picker
        "$mod SHIFT, C, exec, hyprpicker -a"
        
        # Media controls
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioStop, exec, playerctl stop"
        
        # Volume (with SwayOSD)
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
        ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
        
        # Brightness (with SwayOSD)
        ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
        ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
        
        # Focus navigation
        "$mod, left,  movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up,    movefocus, u"
        "$mod, down,  movefocus, d"
        
        # Workspaces
        "$mod, 1, workspace, 1" "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3" "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5" "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7" "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9" "$mod, 0, workspace, 10"
        
        # Move to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        
        # Mouse workspace switching
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up,   workspace, e-1"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      exec-once = [ 
        "waybar" 
        "mako" 
        "hypridle"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];
    };
  };
}
