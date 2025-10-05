{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Terminal
    ghostty 
    
    # Browsers & Communication
    firefox 
    thunderbird 
    
    # Development
    vscode 
    neovim 
    
    # Media
    mpv 
    pavucontrol
    playerctl
    
    # Wayland Utilities
    grim 
    slurp 
    wl-clipboard 
    wl-clip-persist
    
    # System Monitoring
    btop 
    
    # Wayland Compositor Tools
    waybar
    
    # Hyprland Ecosystem (Omarchy-style)
    hyprlock
    hypridle
    hyprpicker
    hyprshot
    hyprsunset

    # Audio & OSD
    swayosd
    wireplumber
    pamixer
    brightnessctl

    # Background & Session
    swaybg
    
    # Clipboard & Selection
    cliphist
    
    # Fonts & Icons
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
  ];
}
