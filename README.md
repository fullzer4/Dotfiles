# 🚀 Dotfiles NixOS + Hyprland

Configuração NixOS modular com Hyprland e Home Manager, inspirada no estilo Omarchy.

## 📦 Componentes Principais

| Categoria | Ferramenta | Descrição |
|-----------|-----------|-----------|
| **Sistema Operacional** | NixOS | Sistema base com Flakes |
| **Gerenciador de Janelas** | Hyprland | Compositor Wayland |
| **Gerenciador de Usuário** | Home Manager | Configuração declarativa do usuário |
| **Shell** | Zsh | Shell moderno com plugins |
| **Prompt** | Starship | Prompt rápido e customizável |
| **Terminal** | Ghostty | Terminal moderno e rápido |
| **Barra de Status** | Waybar | Barra superior customizada |
| **Launcher** | Fuzzel | Menu de aplicativos |
| **Notificações** | Mako | Sistema de notificações |
| **Lock Screen** | Hyprlock | Tela de bloqueio elegante |
| **Idle Manager** | Hypridle | Gerenciamento de inatividade |
| **Wallpaper** | Hyprpaper | Gerenciador de papel de parede |
| **Screenshot** | Hyprshot | Capturas de tela |
| **Color Picker** | Hyprpicker | Seletor de cores |
| **Night Light** | Hyprsunset | Temperatura de cor |
| **Clipboard** | Cliphist + wl-clipboard | Histórico de área de transferência |
| **OSD** | SwayOSD | Display de volume/brilho |
| **Servidor de Áudio** | PipeWire | Sistema de áudio moderno |
| **Gerenciador de Arquivos** | Thunar | Gerenciador leve (XFCE) |
| **Editor de Código** | VSCode + Neovim | IDEs |
| **Navegador** | Firefox | Browser |
| **Email** | Thunderbird | Cliente de email |
| **Player de Vídeo** | MPV | Reprodutor minimalista |
| **Controle de Volume** | Pavucontrol | Mixer de áudio gráfico |
| **Monitor de Sistema** | Btop | Monitor de recursos |
| **Virtualização** | Docker + KVM | Containers e VMs |

## 🐚 Shell Moderno (Zsh)

| Ferramenta | Descrição |
|-----------|-----------|
| **Starship** | Prompt minimalista e rápido com Git integration |
| **Zoxide** | `cd` inteligente - lembra seus diretórios frequentes |
| **Eza** | `ls` moderno com ícones e Git status |
| **Fzf** | Fuzzy finder para busca rápida |
| **Atuin** | Histórico de comandos sincronizado com busca |
| **Bat** | `cat` com syntax highlighting |
| **Fd** | `find` moderno e rápido |
| **Ripgrep** | `grep` ultrarrápido |
| **Duf** | `df` com interface moderna |
| **Dust** | `du` visual e interativo |
| **Procs** | `ps` moderno com cores |
| **Autosuggestions** | Sugestões baseadas no histórico |
| **Syntax Highlighting** | Destaque de sintaxe em tempo real |

### Aliases Úteis

```bash
# Navegação
ls, ll, la, lt    # Eza com diferentes opções
z <dir>           # Zoxide - pular para diretórios
..                # cd ..
...               # cd ../..

# Git
gs                # git status
ga                # git add
gc                # git commit
gp                # git push
gl                # git log --oneline --graph
gd                # git diff

# NixOS
rebuild           # nixos-rebuild switch
rebuild-test      # nixos-rebuild test
rebuild-build     # nixos-rebuild build

# Ferramentas modernas
cat               # bat (com syntax highlighting)
find              # fd
grep              # ripgrep (rg)
```

## ⌨️ Atalhos do Hyprland

### Básicos

| Atalho | Ação |
|--------|------|
| `SUPER + Return` | Abrir terminal (Ghostty) |
| `SUPER + Q` | Fechar janela ativa |
| `SUPER + M` | Sair do Hyprland |
| `SUPER + E` | Abrir gerenciador de arquivos (Thunar) |
| `SUPER + R` | Abrir launcher (Fuzzel) |
| `SUPER + V` | Toggle floating |
| `SUPER + P` | Pseudo-tiling |
| `SUPER + J` | Toggle split |

### Lock & Segurança

| Atalho | Ação |
|--------|------|
| `SUPER + L` | Bloquear tela (Hyprlock) |

### Screenshots

| Atalho | Ação |
|--------|------|
| `Print` | Screenshot de todo output/monitor |
| `SUPER + Print` | Screenshot da janela ativa |
| `SUPER + SHIFT + Print` | Screenshot de região (selecionar área) |

### Utilidades

| Atalho | Ação |
|--------|------|
| `SUPER + C` | Abrir histórico do clipboard |
| `SUPER + SHIFT + C` | Color picker (copia cor para clipboard) |

### Navegação de Janelas

| Atalho | Ação |
|--------|------|
| `SUPER + ←/→/↑/↓` | Mover foco entre janelas |
| `SUPER + [1-9,0]` | Ir para workspace 1-10 |
| `SUPER + SHIFT + [1-9,0]` | Mover janela para workspace 1-10 |
| `SUPER + Scroll` | Navegar entre workspaces |

### Mouse

| Atalho | Ação |
|--------|------|
| `SUPER + LMB` | Mover janela |
| `SUPER + RMB` | Redimensionar janela |

### Mídia

| Atalho | Ação |
|--------|------|
| `XF86AudioPlay` | Play/Pause |
| `XF86AudioNext` | Próxima música |
| `XF86AudioPrev` | Música anterior |
| `XF86AudioStop` | Parar reprodução |

### Volume & Brilho

| Atalho | Ação |
|--------|------|
| `XF86AudioRaiseVolume` | Aumentar volume (com OSD) |
| `XF86AudioLowerVolume` | Diminuir volume (com OSD) |
| `XF86AudioMute` | Mute/Unmute (com OSD) |
| `XF86MonBrightnessUp` | Aumentar brilho (com OSD) |
| `XF86MonBrightnessDown` | Diminuir brilho (com OSD) |

## 🎨 Tema de Cores

```nix
accent    = "#4E9AF1"  # Azul principal
accentAlt = "#6DB3F9"  # Azul claro
bg        = "#0D1117"  # Fundo escuro
bgAlt     = "#161B22"  # Fundo alternativo
fg        = "#D1D5DA"  # Texto claro
warn      = "#FF6B6B"  # Vermelho de aviso
```

## 📁 Estrutura do Projeto

```
.
├── configuration.nix           # Configuração principal do sistema
├── flake.nix                   # Definição do Flake
├── flake.lock                  # Lock de dependências
├── hardware-configuration.nix  # Hardware específico (gerado)
├── home.nix                    # Configuração do Home Manager
│
├── modules/                    # Módulos do sistema NixOS
│   ├── audio.nix              # PipeWire e áudio
│   ├── hyprland.nix           # Hyprland system-level
│   ├── locale.nix             # Localização e timezone
│   ├── packages.nix           # Pacotes do sistema
│   ├── services.nix           # Serviços (SSH, Firefox, etc)
│   ├── users.nix              # Configuração de usuários
│   └── virtualization.nix     # Docker e KVM
│
└── home-modules/               # Módulos do Home Manager
    ├── applications.nix       # Ghostty, Mako, SwayOSD, Cliphist
    ├── colors.nix             # Sistema de cores centralizado
    ├── git.nix                # Configuração do Git
    ├── hypridle.nix           # Gerenciamento de idle
    ├── hyprland.nix           # Configuração do Hyprland
    ├── hyprlock.nix           # Lock screen
    ├── packages.nix           # Pacotes do usuário
    ├── walker.nix             # Fuzzel (launcher)
    ├── waybar.nix             # Barra de status
    └── zsh.nix                # Shell Zsh + Starship + ferramentas
```

## 🔧 Comandos Úteis

### Build & Deploy

```bash
# Buildar sem ativar (teste)
sudo nixos-rebuild build --flake /home/fullzer4/Dotfiles#nixos

# Buildar e ativar
sudo nixos-rebuild switch --flake /home/fullzer4/Dotfiles#nixos

# Ativar temporariamente (não persiste no boot)
sudo nixos-rebuild test --flake /home/fullzer4/Dotfiles#nixos

# Adicionar ao boot sem ativar agora
sudo nixos-rebuild boot --flake /home/fullzer4/Dotfiles#nixos
```

### Hyprland

```bash
# Recarregar configuração do Hyprland
hyprctl reload

# Listar janelas abertas
hyprctl clients

# Listar workspaces
hyprctl workspaces

# Info do monitor
hyprctl monitors
```

### Git

```bash
# Commitar mudanças (necessário para Flakes)
git add .
git commit -m "Update config"

# Push para o repositório
git push
```

## 🚀 Instalação

1. Clone o repositório:
```bash
git clone https://github.com/fullzer4/Dotfiles.git ~/Dotfiles
cd ~/Dotfiles
```

2. Ajuste o `hardware-configuration.nix` para seu hardware:
```bash
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
```

3. Edite `home-modules/git.nix` com seu nome e email.

4. Ajuste o caminho do wallpaper em `home-modules/hyprland.nix`.

5. Build e ative:
```bash
sudo nixos-rebuild switch --flake .#nixos
```

6. Reinicie ou faça logout/login para carregar o Hyprland.

## 📝 Notas

- **Wallpaper**: Coloque sua imagem em `~/Pictures/Wallpapers/mountain.jpg` ou ajuste o path em `hyprland.nix`.
- **State Version**: Sistema e Home Manager em `25.05`.
- **Flakes**: Lembre-se de `git add` arquivos novos antes de rebuildar.
- **Locale**: Timezone em São Paulo, locale pt_BR, teclado US.

## 🎯 Recursos

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Waybar Wiki](https://github.com/Alexays/Waybar/wiki)

## 📜 Licença

MIT License - Sinta-se livre para usar e modificar!

---

**Autor**: fullzer4  
**Email**: gabrielpelizzaro@gmail.com  
**Sistema**: NixOS 25.05