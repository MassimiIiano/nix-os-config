{
  nixpkgs,
  self,
  # inputs,
  ...
}: let
  inherit (self) inputs;
  # user info
  user = {
    username = "spatola";
    description = "Spatola";
  };
  
  # system inports
  core = ../system/core;

  # home manager
  hm = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
    users.${user.username} = {
      imports = [../home];

      _module.args.theme = import ../theme;
    };
  };
in {
  # all my hosts are named after saturn moons btw

  # desktop
  marvin = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        {networking.hostName = "marvin";}
        ./marvin
        core
        hm
      ];
    specialArgs = {
      inherit inputs;
      inherit user;
    };
  };

  # thinkpad
  # calypso = nixpkgs.lib.nixosSystem {
  #   system = "x86_64-linux";
  #   modules =
  #     [
  #       {networking.hostName = "calypso";}
  #       ./calypso
  #       wayland
  #       hmModule
  #       bootloader
  #       impermanence
  #       hw.lenovo-thinkpad-x1-7th-gen
  #       {inherit home-manager;}
  #     ];
  #   specialArgs = {inherit inputs;};
  # };
}
