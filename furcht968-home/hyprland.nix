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
      "$mainMod" = "SUPER";

      env = [
        "XCURSOR_SIZE,Bibata-Modern-Amber"
        "XCURSOR_SIZE,24"
      ];

      input = {
        kb_layout = "jp";
        kb_model = "jp106";
      };

      exec-once = [
        "fcitx5 -d"
        "hyprctl setcursor Bibata-Modern-Amber 24"
      ];

      bind = [
        ", PRINT, exec, dms screenshot all --no-file"

        "$mainMod, V, exec, dms ipc clipboard toggle"

        "$mainMod, D, exec, vesktop"
        "$mainMod, F, exec, pcmanfm"
        "$mainMod, B, exec, firefox"
        "$mainMod, T, exec, kitty"

        "$mainMod, Left, movewindow, l"
        "$mainMod, Right, movewindow, r"
        "$mainMod, Up, movewindow, u"
        "$mainMod, Down, movewindow, d"

        "$mainMod CTRL, Right, workspace, +1"
        "$mainMod CTRL, Left, workspace, -1"

        "$mainMod CTRL SHIFT, Right, movetoworkspace, +1"
        "$mainMod CTRL SHIFT, Left, movetoworkspace, -1"

        "$mainMod, Super_L, exec, dms ipc launcher toggle"
      ];

      misc = {
        background_color = "0x000000";
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      decoration = {
        rounding = 15;
      };

      general = {
        border_size = 0;
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
}
