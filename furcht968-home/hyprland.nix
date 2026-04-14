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
  
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 24;
    hyprcursor.enable = true;
  };

  dconf = {
      enable = true;
      settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      "$mainMod" = "SUPER";

      env = [
        "XCURSOR_THEME,Bibata-Modern-Amber"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,Bibata-Modern-Amber"
        "HYPRCURSOR_SIZE,24"

        "ADW_DISABLE_PORTAL,1"
      ];

      input = {
        kb_layout = "jp";
        kb_model = "jp106";
      };

      exec-once = [
        "hyprctl setcursor Bibata-Modern-Amber 24"
        "fcitx5 -d"
      ];

      bind = [
        ", PRINT, exec, dms screenshot full --no-file"
        "ALT, PRINT, exec, dms screenshot window --no-file"
        "SHIFT ALT, PRINT, exec, dms screenshot --no-file"

        "$mainMod, D, exec, vesktop"
        "$mainMod, F, exec, nautilus"
        "$mainMod, B, exec, firefox"
        "$mainMod, T, exec, kitty"

        "$mainMod, Left, movewindow, l"
        "$mainMod, Right, movewindow, r"
        "$mainMod, Up, movewindow, u"
        "$mainMod, Down, movewindow, d"

        "$mainMod CTRL, Right, workspace, +1"
        "$mainMod CTRL, Left, workspace, -1"

        "$mainMod ALT, Right, movetoworkspace, +1"
        "$mainMod ALT, Left, movetoworkspace, -1"

        "$mainMod, V, exec, dms ipc clipboard toggle"
        "$mainMod, Super_L, exec, dms ipc launcher toggle"
      ];

      misc = {
        disable_hyprland_logo = true;
      };

      decoration = {
        rounding = 15;
      };

      general = {
        border_size = 0;
      };
    };
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
}
