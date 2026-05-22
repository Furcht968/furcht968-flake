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

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-airline-themes
    ];
    extraConfig = ''
      set number

      let g:airline_powerline_fonts = 1
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#buffer_idx_mode = 1
      let g:airline#extensions#whitespace#mixed_indent_algo = 1
      let g:airline_theme="wombat"
    '';
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
    };

    shellAliases = {
      ls = "lsd -a";
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
