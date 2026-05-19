{ config, pkgs, lib, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.override {
      commandLineArgs = "--enable-wayland-ime --ozone-platform=wayland";
    };
  };

  xdg.desktopEntries.discord = {
    name = "Discord";
    exec = "discord --enable-wayland-ime --ozone-platform=wayland %U";
    icon = "discord";
    terminal = false;
  };
  
  
  programs.firefox = {
    enable = true;
    profiles.default = {
    settings = {
        "gfx.webrender.all" = false;
        "gfx.webrender.enabled" = false;
      };
    };
  };
}
