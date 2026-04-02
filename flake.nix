{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
	  pkgs.kitty
	  pkgs.neovim
	  pkgs.git
        ];

      # Reference: 
      # https://github.com/0xrsydn/darwin-dotfiles/blob/main/modules/darwin/system.nix
      # https://nixcademy.com/posts/nix-on-macos/
      # https://nix-darwin.github.io/nix-darwin/manual/index.html
      # https://nixos-and-flakes.thiscute.world/introduction/
      system = {
        primaryUser = "kincaid";

        defaults = {
          dock.autohide = true;
	  dock.persistent-apps = [];
	  finder.FXPreferredViewStyle = "clmv";
	  NSGlobalDomain.AppleInterfaceStyle = "Dark";
	  NSGlobalDomain.KeyRepeat = 2;
        };
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
