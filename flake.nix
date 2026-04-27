{
  description = "macOs and Linux system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    # Optional: Declarative tap management
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    nix-homebrew,
    homebrew-core,
    homebrew-cask,
    sops-nix,
  }: let
    username = "kincaid";
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {
        inherit username inputs;
        inherit (inputs) homebrew-core homebrew-cask;
      };

      modules = [
        ./modules/darwin

        {
          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;
        }

        ({lib, ...}: {
          nixpkgs.config.allowUnfreePredicate = pkg: let
            name = lib.getName pkg;
          in
            builtins.elem name [
              "postman"
            ];
        })

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit username;};
          home-manager.sharedModules = [sops-nix.homeManagerModules.sops];
          home-manager.users.${username} = {
            imports = [
              ./home
              ./home/darwin.nix
            ];
          };
        }
      ];
    };

    # Build linux flake using:
    # $ home-manager switch --flake .#linux
    homeConfigurations."linux" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfreePredicate = pkg:
          builtins.elem (nixpkgs.lib.getName pkg) ["postman"];
      };
      extraSpecialArgs = {inherit inputs username;};
      modules = [
        sops-nix.homeManagerModules.sops
        ./home
        ./home/linux.nix
      ];
    };
  };
}
