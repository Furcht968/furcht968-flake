# edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, config, pkgs, inputs, ... }:

let unstable-pkgs = import inputs.nixpkgs-unstable {
  system = pkgs.system;
  config.allowUnfree = true;
}; 
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.supportedFilesystems = ["ntfs"];

  boot.loader = {
    systemd-boot.enable = false;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    refind.enable = false;
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = unstable-pkgs.linuxPackages.extend (self: super: {
    kernel = (super.kernel.override {
      stdenv = pkgs.clangStdenv;
      structuredExtraConfig = with lib.kernel; {
        EXPERT = yes;
        PREEMPT_RT = yes;

        NTSYNC = yes;
        ANDROID_BINDER_IPC = yes;
        ANDROID_BINDERFS = yes;
        ANDROID_BINDER_DEVICES = freeform "binder,hwbinder,vndbinder";

        IP_NF_IPTABLES = yes;
        IP_NF_FILTER = yes;
        IP_NF_NAT = yes;
        IP_NF_MANGLE = yes;
        NF_TABLES = yes;
        NF_CONNTRACK = yes;
        NETFILTER_XTABLES = yes;
      };
      ignoreConfigErrors = true;
    }).overrideAttrs (old: {
      makeFlags = (old.makeFlags or []) ++ [
        "LLVM=1"
        "LLVM_IAS=1"
      ];
    });
  });
  boot.kernelModules = ["ntsync"];
  boot.kernelParams = [
    "nvidia.NVreg_TemporaryFilePath=/var/tmp"
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.nftables.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [67 53];
  };

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable tailscale.
  services.tailscale.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  security.sudo.enable = false;
  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = false;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.furcht968 = {
    isNormalUser = true;
    description = "furcht968";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install zsh.
  programs.zsh.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
    os-prober
    zsh neovim vim lsd
    git python3 ghq
    gnumake cmake ninja
    llvm libcxx lld clang
    home-manager
    starship nerd-fonts.caskaydia-mono
    opencode
    nftables
    zip unzip p7zip
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
