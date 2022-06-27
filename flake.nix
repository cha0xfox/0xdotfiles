{
  description = "0xdotfiles";

  inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      nixpkgs-master.url = "github:nixos/nixpkgs/master";
      nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-22.05";
      home-manager.url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, homeConfigurations, emacs-overlay, flake-utils, ... }: 
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config  = { 
        allowUnfree = true;
        allowUnsupportedSystem = true;
      };

      overlays = [
        (
          final: prev:
          let
            # system = prev.stdenv.system;
            inherit system;
            nixpkgs-stable = inputs.nixos-stable;
          in {
            master = inputs.nixpkgs-master.legacyPackages.${system};
            stable = inputs.nixpkgs-stable.legacyPackages.${system};
          }
        )
      ];

    };

    lib = nixpkgs.lib;

  in {
    homeConfigurations = {
      # cha0xfox = home-manager.lib.homeManagerConfiguration {
      #   inherit system pkgs;
      #   # inherit system;
      #   # pkgs = nixpkgsConfig;

      #   username = "cha0xfox";
      #   homeDirectory = "/home/cha0xfox";
      #   stateVersion = "21.05";
      #   configuration = {
      #     imports = [
      #       /home/cha0xfox/0xdotfiles/users/cha0xfox/home.nix
      #     ];
      #   };
      # };

      inherit system pkgs;
      modules = [
        /home/cha0xfox/0xdotfiles/users/cha0xfox/home.nix
        {
          home = {
            username = "cha0xfox";
            homeDirectory = "/home/cha0xfox";
            stateVersion = "21.05";
          };
        }
      ];
    };

    nixosConfigurations = {
      "0x" = lib.nixosSystem {
        inherit system pkgs;
        # inherit system;
        # pkgs = nixpkgsConfig;

        modules = [
          ./system/configuration.nix
        ];
      };
    };
  };


}
