{pkgs, inputs, ...}: 

let unstable-pkgs = import inputs.nixpkgs-unstable {
  system = pkgs.system;
  config.allowUnfree = true;
};
in {
  environment.systemPackages = with unstable-pkgs; [
    reaper
    lmms
    vital
  ];
}
