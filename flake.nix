{
  description = "spatola's config";

  outputs = { self, nixpkgs, ... }@inputs: {
    
    # NixOS Configuration
    nixosConfigurations.marvin = nixpkgs.lib.nixosSystem {
      
      system = "x86_64-linux";

      modules =
        [
          # Name of the host
          {networking.hostName = "marvin";}

          # Main configuration file for NixOS
          ./conf/configuration.nix

          # User configuration with home-manager
          inputs.home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Personal User Configuration
            home-manager.users.spatola = import ./home/spatola.nix;

            # Work User Configuration
            home-manager.users.ict = import ./home/ict.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      
      specialArgs = { inherit inputs; };
    };
  };

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-db = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    
  };
}
