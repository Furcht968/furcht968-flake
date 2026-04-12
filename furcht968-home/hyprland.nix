{ config, pkgs, lib, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
    iconTheme = {
      name = "Numix-Circle";
      package = pkgs.numix-icon-theme-circle;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };
  };

  dconf.enable = true;
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      input = {
        kb_layout = "jp";
        kb_model = "jp106";
      };

      exec-once = [
        "dms run"
        "fcitx5 -d"
      ];

      bind = [
        ", PRINT, exec, hyprshot -m output --clipboard-only"
      ];

      misc = {
        background_color = "0x000000";
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      decoration = {
        rounding = 10;
      };
    };
  };

  programs.hyprshot = {
    enable = true;
    saveLocation = "$HOME/Pictures/Screenshots";
  };
  
  home.file.".config/DankMaterialShell/settings.json" = {
    source = ./dms-settings.json;
  };

  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      background_opacity = 0.75;
      background_blur = 3;
    };
  };

  home.packages = with pkgs; [ hyprshot wl-clipboard libnotify ];
}
