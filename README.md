# My Dotfiles

Minimal NixOS desktop using **flake.nix**, **Hyprland**, and **Home Manager**.  
Focus: essentials and clear keybindings — no fluff.

---

## Requirements
- **NixOS** with flakes enabled
- Wayland-capable GPU/drivers

---

## How to set up
1) **Clone**
```bash
git clone https://github.com/fullzer4/Dotfiles.git ~/Dotfiles
cd ~/Dotfiles
```
2) (Optional) Refresh hardware profile3) Habilitar Flakes no sistema
```bash
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
```
3) Build & activate
```bash
sudo nixos-rebuild switch --flake .#nixos
```
4) Log in to Hyprland (or restart your session)

## Main Components

| Category | Tool | Notes |
|---|---|---|
| OS | **NixOS (Flakes)** | Reproducible system config |
| Window Manager | **Hyprland** | Wayland compositor |
| User Manager | **Home Manager** | Declarative per-user config |
| Shell | **Zsh** | Plugins + quality-of-life |
| Prompt | **Starship** | Fast, minimal prompt |
| Terminal | **Ghostty** | Modern, GPU-accelerated |
| Status Bar | **Waybar** | Top bar w/ modules |
| App Launcher | **Fuzzel** | Minimal launcher |
| Notifications | **Mako** | Lightweight daemon |
| Lock / Idle / Wallpaper | **Hyprlock / Hypridle / Hyprpaper** | Cohesive suite |
| Screenshot / Color / Night | **Hyprshot / Hyprpicker / Hyprsunset** | Essentials |
| Clipboard | **Cliphist + wl-clipboard** | History + CLI |
| OSD | **SwayOSD** | Volume/brightness OSD |
| Audio | **PipeWire** | Modern audio stack |
| File Manager | **Thunar** | Lightweight GTK |
| Editors | **VSCode + Neovim** | Pick your poison |
| Browser / Mail | **Firefox / Thunderbird** | Daily drivers |
| Media | **MPV** | Minimal player |
| Audio Mixer | **Pavucontrol** | GUI mixer |
| System Monitor | **btop** | TUI monitor |
| Virtualization | **Docker + KVM** | Containers & VMs |

## Keybindings — Basics

| Keys | Action |
|---|---|
| `SUPER + Return` | Open terminal (Ghostty) |
| `SUPER + Q` | Close focused window |
| `SUPER + M` | Exit Hyprland |
| `SUPER + E` | Open file manager (Thunar) |
| `SUPER + R` | App launcher (Fuzzel) |
| `SUPER + V` | Toggle floating |
| `SUPER + P` | Pseudo-tiling |
| `SUPER + J` | Toggle split |

## Keybindings — Security

| Keys | Action |
|---|---|
| `SUPER + L` | Lock screen (Hyprlock) |

## Keybindings — Screenshots

| Keys | Action |
|---|---|
| `Print` | Full monitor screenshot |
| `SUPER + Print` | Active window screenshot |
| `SUPER + SHIFT + Print` | Region selection screenshot |

## Keybindings — Utilities

| Keys | Action |
|---|---|
| `SUPER + C` | Clipboard history (Cliphist) |
| `SUPER + SHIFT + C` | Color picker (Hyprpicker) |

## Keybindings — Window & Workspace Navigation

| Keys | Action |
|---|---|
| `SUPER + ←/→/↑/↓` | Move focus between windows |
| `SUPER + [1–9,0]` | Switch to workspace 1–10 |
| `SUPER + SHIFT + [1–9,0]` | Move window to workspace 1–10 |
| `SUPER + Scroll` | Cycle workspaces |

## Keybindings — Mouse

| Keys | Action |
|---|---|
| `SUPER + LMB` | Move window |
| `SUPER + RMB` | Resize window |
| `XF86MonBrightnessUp` | Brightness up (OSD) |
| `XF86MonBrightnessDown` | Brightness down (OSD) |
