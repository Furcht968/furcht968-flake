{pkgs, inputs, ...}: 

let unstable-pkgs = import inputs.nixpkgs-unstable {
  system = pkgs.system;
  config.allowUnfree = true;
};
in {
  programs.nix-ld.enable = true;
  environment.systemPackages = with unstable-pkgs; [
    bun
    nodejs
    uv
    cargo
    rustc
  ];
}
