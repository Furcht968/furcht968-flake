{pkgs, inputs, ...}: 

let unstable-pkgs = import inputs.nixpkgs-unstable {
  system = pkgs.system;
  config.allowUnfree = true;
};
in {
  environment.systemPackages = with unstable-pkgs; [
    wineWow64Packages.stable
    dxvk
    winetricks
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
