{ config, pkgs, lib, ... }: {
  home.username = "furcht968";
  home.homeDirectory = "/home/furcht968";
  home.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;
  
  imports = [
    ./latex.nix
    ./hyprland.nix
    ./hyprland-app-environment.nix
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "furcht968";
        email = "furcht968@gmail.com";
      };
      init.defaultBranch = "master";
    };
  };

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      svelte.svelte-vscode
      vue.volar
      james-yu.latex-workshop
    ];
  };

  programs.zsh = {
    enable = true;
    sessionVariables = {
      PATH = "/home/furcht968/.bun/bin:$PATH";
      CC = "clang";
      LD = "ld.lld";
      AR = "llvm-ar";
      NM = "llvm-nm";
      STRIP = "llvm-strip";
      GHQ_ROOT="$HOME/ghq";
    };

    shellAliases = {
      ls = "lsd -a";
      vi = "nvim";
      vim = "nvim";
    };

    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };
  
  home.file.".config/starship.toml" = {
    source = ./src/starship-config.toml;
  };

  home.file.".config/nvim/init.lua" = {
    source = ./src/nvim-init.lua;
  };
}
