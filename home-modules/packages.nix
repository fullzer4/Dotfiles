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
    hyprlock         # Lock screen
    hypridle         # Idle management
    hyprpicker       # Color picker
    hyprshot         # Screenshot tool
    hyprsunset       # Night light / color temperature
    
    # Audio & OSD
    swayosd          # On-screen display for volume/brightness
    wireplumber
    pamixer
    brightnessctl    # Brightness control
    
    # Background & Session
    swaybg           # Wallpaper daemon (alternative to hyprpaper)
    
    # Clipboard & Selection
    cliphist         # Clipboard manager
    
    # Fonts & Icons
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
  ];
}
