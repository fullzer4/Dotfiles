{ config, pkgs, colors, ... }:

{
  home.packages = with pkgs; [
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.tumbler
    xfce.xfconf
  ];

  xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/thunar.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <channel name="thunar" version="1.0">
      <property name="last-view" type="string" value="ThunarIconView"/>
      <property name="last-icon-view-zoom-level" type="string" value="THUNAR_ZOOM_LEVEL_NORMAL"/>
      <property name="last-window-width" type="int" value="1200"/>
      <property name="last-window-height" type="int" value="800"/>
      <property name="last-window-maximized" type="bool" value="false"/>
      <property name="last-separator-position" type="int" value="200"/>
      <property name="last-show-hidden" type="bool" value="true"/>
      <property name="last-side-pane" type="string" value="ThunarShortcutsPane"/>
      <property name="misc-single-click" type="bool" value="false"/>
      <property name="misc-middle-click-in-tab" type="bool" value="true"/>
      <property name="misc-recursive-search" type="string" value="THUNAR_RECURSIVE_SEARCH_LOCAL"/>
      <property name="misc-date-style" type="string" value="THUNAR_DATE_STYLE_SIMPLE"/>
      <property name="misc-folders-first" type="bool" value="true"/>
      <property name="misc-horizontal-wheel-navigates" type="bool" value="false"/>
      <property name="misc-thumbnail-mode" type="string" value="THUNAR_THUMBNAIL_MODE_ALWAYS"/>
      <property name="misc-text-beside-icons" type="bool" value="false"/>
      <property name="shortcuts-icon-size" type="string" value="THUNAR_ICON_SIZE_SMALL"/>
      <property name="tree-icon-size" type="string" value="THUNAR_ICON_SIZE_SMALLER"/>
    </channel>
  '';

  xdg.configFile."gtk-3.0/gtk.css".text = ''
    /* Thunar customizado - tema escuro moderno */
    
    .thunar window {
      background-color: ${colors.bg};
      color: ${colors.fg};
    }
    
    .thunar .sidebar {
      background-color: ${colors.bgAlt};
      border-right: 1px solid rgba(78, 154, 241, 0.2);
    }
    
    .thunar .sidebar row {
      padding: 8px;
      border-radius: 6px;
      margin: 2px 6px;
    }
    
    .thunar .sidebar row:hover {
      background-color: rgba(78, 154, 241, 0.15);
    }
    
    .thunar .sidebar row:selected {
      background-color: ${colors.accent};
      color: white;
    }
    
    .thunar toolbar {
      background-color: ${colors.bgAlt};
      border-bottom: 1px solid rgba(78, 154, 241, 0.2);
      padding: 6px;
    }
    
    .thunar toolbar button {
      border-radius: 6px;
      padding: 6px 12px;
      border: none;
      background-color: transparent;
    }
    
    .thunar toolbar button:hover {
      background-color: rgba(78, 154, 241, 0.2);
    }
    
    .thunar toolbar button:active {
      background-color: ${colors.accent};
    }
    
    .thunar .path-bar button {
      border-radius: 6px;
      margin: 2px;
      padding: 4px 10px;
      background-color: ${colors.bgAlt};
      border: 1px solid rgba(78, 154, 241, 0.3);
    }
    
    .thunar .path-bar button:hover {
      background-color: rgba(78, 154, 241, 0.2);
      border-color: ${colors.accent};
    }
    
    .thunar iconview {
      background-color: ${colors.bg};
      padding: 12px;
    }
    
    .thunar iconview:selected {
      background-color: ${colors.accent};
      border-radius: 8px;
    }
    
    .thunar entry {
      background-color: ${colors.bgAlt};
      color: ${colors.fg};
      border: 1px solid rgba(78, 154, 241, 0.3);
      border-radius: 6px;
      padding: 6px;
    }
    
    .thunar entry:focus {
      border-color: ${colors.accent};
      box-shadow: 0 0 0 2px rgba(78, 154, 241, 0.2);
    }
    
    .thunar scrollbar {
      background-color: transparent;
    }
    
    .thunar scrollbar slider {
      background-color: rgba(78, 154, 241, 0.3);
      border-radius: 10px;
      min-width: 8px;
      min-height: 8px;
    }
    
    .thunar scrollbar slider:hover {
      background-color: rgba(78, 154, 241, 0.5);
    }
    
    .thunar menu {
      background-color: ${colors.bgAlt};
      border: 1px solid rgba(78, 154, 241, 0.3);
      border-radius: 8px;
      padding: 4px;
    }
    
    .thunar menuitem {
      border-radius: 6px;
      padding: 8px 12px;
    }
    
    .thunar menuitem:hover {
      background-color: rgba(78, 154, 241, 0.2);
    }
    
    .thunar statusbar {
      background-color: ${colors.bgAlt};
      border-top: 1px solid rgba(78, 154, 241, 0.2);
      padding: 4px 8px;
    }
    
    .thunar headerbar {
      background-color: ${colors.bgAlt};
      border-bottom: 1px solid rgba(78, 154, 241, 0.2);
    }
    
    .thunar tooltip {
      background-color: ${colors.bgAlt};
      color: ${colors.fg};
      border: 1px solid ${colors.accent};
      border-radius: 6px;
    }
  '';

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
