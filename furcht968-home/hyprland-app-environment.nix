{ config, pkgs, lib, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.override {
      commandLineArgs = "--enable-wayland-ime --ozone-platform=wayland";
    };
  };

  xdg.desktopEntries.vesktop = {
    name = "Vesktop";
    exec = "vesktop -ozone-platform-hint=auto --enable-features=AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL,VaapiIgnoreDriverChecks,VaapiOnNvidiaGPUs --enable-features=WebRTCPipeWireCapturer --enable-wayland-ime --ozone-platform=wayland %U";
    icon = "vesktop";
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
