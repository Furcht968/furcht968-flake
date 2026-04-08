{ config, pkgs, ... }:

let proton-ge-rtsp = pkgs.stdenv.mkDerivation rec {
  pname = "proton-ge-rtsp-bin";
  version = "GE-Proton10-26-rtsp20";

  src = pkgs.fetchurl {
    url = "https://github.com/SpookySkeletons/proton-ge-rtsp/releases/download/${version}/${version}.tar.gz";
    sha256 = "sha256-xEG3x+DlNrvhT8XbLaAsx+mmFuGz8vL9lwRHMe+I4iU="; 
  };

    installPhase = ''
      mkdir -p $out
      tar -C $out --strip-components=1 -xzvf $src
    '';

    dontBuild = true;
    dontFixup = true;
};
in
{
  hardware.steam-hardware.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-rtsp
    ];
  };

  nixpkgs.config.packageOverride = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [ migu ];
    };
  };
}
