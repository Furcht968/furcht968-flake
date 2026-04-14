{lib, config, pkgs, ...}: {
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    firefox vscode vlc gedit obs-studio vesktop obsidian thunderbird pcmanfm eog
    inkscape blender
  ];

  virtualisation.waydroid.enable = true;
}
