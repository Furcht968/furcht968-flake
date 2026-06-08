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
        "XCURSOR_THEME,Bibata-Modern-Amber"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,Bibata-Modern-Amber"
        "HYPRCURSOR_SIZE,24"
      ];

      input = {
        kb_layout = "jp";
        kb_model = "jp106";
      };

      exec-once = [
        "fcitx5 -d"
        "gsettings set org.gnome.desktop.interface color-scheme prefer-dark" 
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "sleep 1 && systemctl --user restart xdg-desktop-portal xdg-desktop-portal-hyprland"
    ];

      bind = [
        ", PRINT, exec, dms screenshot full --no-file"
        "ALT, PRINT, exec, dms screenshot window --no-file"
        "SHIFT ALT, PRINT, exec, dms screenshot --no-file"

        "$mainMod, T, exec, kitty"
        "$mainMod, B, exec, zen"
        "$mainMod, F, exec, pcmanfm"
	"$mainMod, C, exec, code"
        "$mainMod, D, exec, vesktop"

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
      
      bindel = [
        ", XF86AudioRaiseVolume, exec, dms ipc audio increment 5"
        ", XF86AudioLowerVolume, exec, dms ipc audio decrement 5"
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
  
  home.activation.copyMyFile = lib.hm.dag.entryAfter ["writeBoundary"] ''
    cp ${./src/dms-settings.json} $HOME/.config/DankMaterialShell/settings.json
    chmod 644 $HOME/.config/DankMaterialShell/settings.json
  '';

  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      background_opacity = 0.75;
      background_blur = 3;
    };
  };
  
  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
  };
}
