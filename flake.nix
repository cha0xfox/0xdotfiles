{
  description = "0xdotfiles";

  inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager.url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config  = { allowUnfree = true; };
    };

    lib = nixpkgs.lib;
  in {
    homeConfigurations = {
      cha0xfox = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;

        username = "cha0xfox";
        homeDirectory = "/home/cha0xfox";
        stateVersion = "21.05";
        configuration = {
          imports = [
            ./users/cha0xfox/home.nix
          ];
        };
      };
    };

    nixosConfigurations = {
      "0x" = lib.nixosSystem {
        inherit system pkgs;

        modules = [
          ./system/configuration.nix
        ];
      };
    };
  };
}
