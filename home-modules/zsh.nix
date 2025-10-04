{ config, lib, pkgs, colors, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" ];
    };
    syntaxHighlighting.enable = true;

    # Histórico robusto
    history = {
      size = 200000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
      save = 10000;
    };

    # Aliases sem ícones (clean)
    shellAliases = {
      ls = "eza --group-directories-first";
      ll = "eza -l --group-directories-first --git";
      la = "eza -la --group-directories-first --git";
      lt = "eza --tree --group-directories-first";
      tree = "eza --tree";

      ".." = "cd .."; "..." = "cd ../.."; "...." = "cd ../../..";

      gs = "git status -sb";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";
      gd = "git diff";

      rebuild       = "sudo nixos-rebuild switch --flake ~/Dotfiles#nixos";
      rebuild-test  = "sudo nixos-rebuild test --flake ~/Dotfiles#nixos";
      rebuild-build = "sudo nixos-rebuild build --flake ~/Dotfiles#nixos";

      cat = "bat";
      df  = "duf";
      du  = "dust";
      ps  = "procs";
      top = "btop";

      c = "clear";
      h = "history";
      mkd = "mkdir -pv";
    };

    # Init bem organizado
    initExtra = ''
      ##### Completion previsível
      autoload -Uz compinit && compinit -C
      zmodload zsh/complist
      setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS EXTENDED_GLOB GLOB_DOTS
      setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY INC_APPEND_HISTORY
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu select
      zstyle ':completion:*' special-dirs true
      zstyle ':completion:*' squeeze-slashes true

      ##### Keybindings (modo vi + navegação)
      bindkey -v
      bindkey '^[[A' history-beginning-search-backward
      bindkey '^[[B' history-beginning-search-forward
      bindkey '^[[H' beginning-of-line
      bindkey '^[[F' end-of-line
      bindkey '^[[3~' delete-char

      ##### Cores via dircolors (sem hardcode)
      if command -v dircolors >/dev/null 2>&1; then
        eval "$(dircolors -b)"
      fi

      ##### FZF com sua paleta
      export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info \
        --color=bg+:${colors.bgAlt},bg:${colors.bg},spinner:${colors.accent},hl:${colors.accentAlt},\
fg:${colors.fg},header:${colors.accent},info:${colors.accentAlt},pointer:${colors.accent},\
marker:${colors.accent},fg+:${colors.fg},prompt:${colors.accent},hl+:${colors.accentAlt}"

      ##### Atuin: só Ctrl-R (↑ padrão do Zsh)
      eval "$(atuin init zsh --disable-up-arrow)"
      bindkey '^r' _atuin_search_widget

      # Mensagem de boas-vindas sóbria (sem emoji)
      print -P ""
      print -P "  %F{${colors.accent}}Bem-vindo de volta,%f %F{${colors.fg}}fullzer4%f"
      print -P ""
    '';
  };

  # Starship totalmente sem emojis/ícones
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;

      # Esquerda minimal
      format = "$directory$git_branch$git_status$cmd_duration$nix_shell$nodejs$python$rust$docker_context$character";

      # Cursor/char ASCII
      character = {
        success_symbol = "[>](bold ${colors.accent})";
        error_symbol   = "[>](bold ${colors.warn})";
      };

      # Diretório sem cadeado/ícone
      directory = {
        style = "bold ${colors.accentAlt}";
        truncation_length = 3;
        truncate_to_repo = true;
        read_only = " [RO]";
        format = "[$path]($style)[$read_only]($style) ";
      };

      # Git: texto puro, adulto
      git_branch = {
        # sem símbolo; prefixo textual
        format = "git:[$branch]($style) ";
        style  = "bold ${colors.accent}";
        symbol = "";
      };

      git_status = {
        style   = "bold ${colors.warn}";
        format  = "([$all_status$ahead_behind]($style) )";
        conflicted = "conf:\${count} ";
        ahead     = "ahead \${count} ";
        behind    = "behind \${count} ";
        diverged  = "div \${ahead_count}/\${behind_count} ";
        untracked = "new:\${count} ";
        stashed   = "stash:\${count} ";
        modified  = "mod:\${count} ";
        staged    = "+\${count} ";
        renamed   = "mv:\${count} ";
        deleted   = "del:\${count} ";
      };

      # Módulos de linguagens: sem símbolos
      nix_shell = { symbol = ""; format = "via [$state]($style) "; style = "bold blue"; };
      nodejs    = { symbol = ""; format = "via [node $version]($style)"; style = "bold green"; };
      python    = { symbol = ""; format = "via [py $version]($style)";   style = "bold yellow"; };
      rust      = { symbol = ""; format = "via [rust $version]($style)"; style = "bold red"; };
      docker_context = { symbol = ""; format = "via [docker $context]($style) "; style = "bold cyan"; };

      cmd_duration = { min_time = 300; format = "took [$duration](bold yellow) "; };
    };
  };

  programs.zoxide = { enable = true; enableZshIntegration = true; };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f --hidden --follow --exclude .git";
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [ "--disable-up-arrow" ];
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      search_mode = "fuzzy";
      filter_mode = "global";
      style = "compact";
      inline_height = 20;
      show_preview = true;
      exit_mode = "return-query";
      keymap_mode = "vim-normal";
    };
  };

  # eza/bat sem ícones
  programs.eza = { enable = true; enableZshIntegration = true; git = true; icons = false; };
  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
      style = "numbers,changes,header";
      pager = "less -FR";
    };
  };

  home.packages = with pkgs; [ fd ripgrep duf dust procs coreutils ];
}
