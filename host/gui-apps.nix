{inputs, lib, config, pkgs, ...}: {
  programs.firefox.enable = true;

  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };
  };

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    vscode vlc vesktop gedit obsidian thunderbird pcmanfm eog
    inkscape blender
  ];

  virtualisation.waydroid.enable = true;
}
