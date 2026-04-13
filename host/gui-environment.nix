{lib, config, pkgs, inputs, ...}: {

  imports = [
    inputs.dms.nixosModules.dank-material-shell
    inputs.dms.nixosModules.greeter
  ];

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

  console = { 
    keyMap = "jp106";
    earlySetup = true;
  };
  
  programs.hyprland.enable = true;
  
  programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    dgop.package = inputs.dgop.packages.${pkgs.system}.default;

    greeter = {
      enable = true;
      compositor = {
        name = "hyprland";
        customConfig = ''
          env = DMS_RUN_GREETER,1
          
          misc {
            disable_hyprland_logo = true
          }
          
          input {
            kb_layout = jp
          }
          
          env = XCURSOR_THEME,Bibata-Modern-Amber
          env = XCURSOR_SIZE,24
          env = HYPRCURSOR_THEME,Bibata-Modern-Amber
          env = HYPRCURSOR_SIZE,24
          exec-once = hyprctl setcursor Bibata-Modern-Amber 24
        '';
      };
      configHome = "/home/furcht968";
    };
  };

  # Enable sound with Pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-panel gnomeExtensions.blur-my-shell gnomeExtensions.date-menu-formatter gnomeExtensions.kimpanel
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
}
