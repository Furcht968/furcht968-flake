{ config, pkgs, lib, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.override {
      commandLineArgs = "--enable-wayland-ime --ozone-platform=wayland";
    };
  };

  xdg.desktopEntries.vesktop = {
    name = "Vesktop";
    exec = "vesktop --enable-wayland-ime --ozone-platform=wayland %U";
    icon = "vesktop";
    terminal = false;
  };
}
