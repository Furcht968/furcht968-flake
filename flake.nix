{
  description = "Mimikovistic NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, dms, dgop, ...}@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./host/configuration.nix
        ./host/gui-environment.nix
        ./host/gui-apps.nix
        ./host/my-external-storage.nix
        ./host/steam.nix
        ./host/wine.nix
        ./host/development.nix
        ./host/nvidia.nix
        
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.users.furcht968 = import ./furcht968-home/home.nix;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
}
