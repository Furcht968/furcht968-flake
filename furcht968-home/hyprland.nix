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

  dconf = {
      enable = true;
      settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Adwaita-dark";
      };
    };
  };
  
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
        "hyprctl setcursor Bibata-Modern-Amber 24"
        "fcitx5 -d"
      ];

      bind = [
        ", PRINT, exec, dms screenshot all --no-file"

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
