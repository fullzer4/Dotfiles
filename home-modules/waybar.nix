{ config, pkgs, colors, ... }:

{
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      exclusive = true;
      position = "top";
      height = 30;

      modules-left   = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right  = [ "tray" "bluetooth" "network" "pulseaudio" "backlight" "battery" "hyprland/language" ];

      "hyprland/workspaces" = {
        disable-scroll = false;
        all-outputs = true;
        format = "{icon}";
        on-click = "activate";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "10" = "10";
          urgent = "";
          active = "";
          default = "";
        };
      };
      
      "hyprland/window" = {
        format = "{}";
        max-length = 50;
        separate-outputs = true;
      };
      
      "hyprland/language" = {
        format = " {}";
        format-en = "EN";
        format-pt = "PT";
      };

      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%A, %d %B %Y - %H:%M}";
        tooltip-format = "<tt><small>{calendar}</small></tt>";
        calendar = {
          mode = "year";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          format = {
            months = "<span color='${colors.accent}'><b>{}</b></span>";
            days = "<span color='${colors.fg}'><b>{}</b></span>";
            weeks = "<span color='${colors.accentAlt}'><b>W{}</b></span>";
            weekdays = "<span color='${colors.accent}'><b>{}</b></span>";
            today = "<span color='${colors.warn}'><b><u>{}</u></b></span>";
          };
        };
      };
      
      tray = {
        icon-size = 16;
        spacing = 10;
      };
      
      bluetooth = {
        format = " {status}";
        format-connected = " {device_alias}";
        format-connected-battery = " {device_alias} ({device_battery_percentage}%)";
        tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
      };

      network = {
        format-wifi = "  {essid}";
        format-ethernet = "  Wired";
        format-disconnected = " Offline";
        tooltip-format = "{ifname} via {gwaddr}";
        tooltip-format-wifi = "  {essid} ({signalStrength}%)";
        tooltip-format-ethernet = "  {ifname}";
        tooltip-format-disconnected = "Disconnected";
      };
      
      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = " Muted";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
        };
        on-click = "pavucontrol";
      };
      
      backlight = {
        format = "{icon} {percent}%";
        format-icons = ["" "" "" "" "" "" "" "" ""];
      };

      battery = {
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-full = " {capacity}%";
        format-icons = ["" "" "" "" ""];
        states = {
          warning = 30;
          critical = 15;
        };
      };
    };
  };

  home.file.".config/waybar/style.css" = {
    force = true;
    text = ''
      * { 
        font-family: "JetBrainsMono Nerd Font", monospace; 
        font-size: 12px; 
        min-height: 0; 
      }
      
      window#waybar {
        background: rgba(22, 27, 34, 0.67);
        color: ${colors.fg};
        border-bottom: 1px solid ${colors.accent};
      }
      
      #workspaces button { 
        padding: 0 8px; 
        margin: 0 2px; 
        background: transparent; 
        color: ${colors.fg}; 
        border-radius: 6px;
        transition: all 0.3s ease;
      }
      
      #workspaces button.active { 
        background: ${colors.accent}; 
        color: ${colors.bg}; 
      }
      
      #workspaces button.urgent { 
        background: ${colors.warn}; 
        color: ${colors.bg}; 
      }
      
      #workspaces button:hover {
        background: rgba(78, 154, 241, 0.3);
      }
      
      #window {
        padding: 0 10px;
        color: ${colors.accentAlt};
        font-weight: bold;
      }
      
      #clock,
      #battery,
      #network,
      #pulseaudio,
      #backlight,
      #bluetooth,
      #tray,
      #language { 
        padding: 0 10px; 
      }
      
      #battery.warning { 
        color: ${colors.warn}; 
      }
      
      #battery.critical { 
        color: ${colors.warn}; 
        font-weight: bold; 
        animation: blink 1s linear infinite;
      }
      
      @keyframes blink {
        to {
          background-color: ${colors.warn};
          color: ${colors.bg};
        }
      }
      
      #network.disconnected,
      #bluetooth.disabled {
        color: rgba(209, 213, 218, 0.4);
      }
      
      #pulseaudio.muted {
        color: rgba(209, 213, 218, 0.4);
      }
      
      #tray > .passive {
        -gtk-icon-effect: dim;
      }
      
      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: ${colors.warn};
      }
      
      tooltip {
        background: ${colors.bg};
        color: ${colors.fg};
        border: 1px solid ${colors.accent};
        border-radius: 8px;
      }
    '';
  };
}
