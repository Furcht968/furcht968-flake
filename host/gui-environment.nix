{lib, config, pkgs, inputs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = false;
  services.desktopManager.gnome.enable = false;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "jp";
    variant = "";
  };

  services.gvfs.enable = true;

  console = { 
    keyMap = "jp106";
    earlySetup = true;
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/start-hyprland";
      };
    };
  };
 
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };
  
  programs.dms-shell = {
    enable = true;
    quickshell.package = pkgs.quickshell;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };

  services.displayManager.dms-greeter = {
    enable = true;
    logs = {
      save = true;
      path = "/var/lib/dms-greeter/dms-greeter.log";
    };
    compositor = {
      name = "hyprland";
      customConfig = ''
       misc {
          disable_hyprland_logo = true
        }
          
        input {
          kb_layout = jp
        }
          
        env = XCURSOR_THEME,Bibata-Modern-Amber
        env = XCURSOR_SIZE,23
        env = HYPRCURSOR_THEME,Bibata-Modern-Amber
        env = HYPRCURSOR_SIZE,23
        exec-once = hyprctl setcursor Bibata-Modern-Amber 23
      '';
    };
    configHome = "/home/furcht968";
  };

  # Enable sound with Pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;

    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.pipewire.wireplumber.extraConfig = {
    "99-screencast-policy" = {
      "wireplumber.settings" = {
        "link.max-retries" = 3;
        "link.retry-ms" = 500;
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [ "hyprland" "gtk" ];
      hyprland = {
        default = [ "hyprland" "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
        "org.freedesktop.impl.portal.RemoteDesktop" = [ "hyprland" ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
    numix-icon-theme-circle papirus-icon-theme
    kitty bibata-cursors
  ];

  fonts.packages = with pkgs; [
    noto-fonts noto-fonts-cjk-sans noto-fonts-color-emoji
  ];

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
    fcitx5.waylandFrontend = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
  };
}
