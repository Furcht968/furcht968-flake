{pkgs, inputs, ...}: 

let unstable-pkgs = import inputs.nixpkgs-unstable {
  system = pkgs.system;
  config.allowUnfree = true;
};
in {
  environment.systemPackages = [
    unstable-pkgs.wineWow64Packages.stable
    unstable-pkgs.dxvk.out
    unstable-pkgs.winetricks
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
