{ pkgs, username, ...}: {

	users.users.${username} = {
		name = username;
		home = "/Users/${username}";
	};

  # Necessary for using flakes on this system.
	nix = {
		settings = {
			experimental-features = "nix-command flakes";
		};

		gc = {
			automatic = true;
			interval = { Weekday = 0; Hour = 0; Minute = 0; };
			options = "--delete-older-than 30d";
		};
	};

	# List packages installed in system profile. To search by name, run:
	# $ nix-env -qaP | grep wget
	environment.systemPackages = [ 
		pkgs.kitty
	];

	# Reference: 
	# https://github.com/0xrsydn/darwin-dotfiles/blob/main/modules/darwin/system.nix
	# https://nixcademy.com/posts/nix-on-macos/
	# https://nix-darwin.github.io/nix-darwin/manual/index.html
	# https://nixos-and-flakes.thiscute.world/introduction/
	system = {
		primaryUser = username;

		defaults = {
			dock = {
				autohide = true;
				persistent-apps = [];
			};
			finder = {
				AppleShowAllExtensions = true;
				ShowPathbar = true;
				FXPreferredViewStyle = "clmv";
			};
			NSGlobalDomain = {
				AppleInterfaceStyle = "Dark";
				KeyRepeat = 2;
			};
		};

		# Used for backwards compatibility, please read the changelog before changing.
		# $ darwin-rebuild changelog
		stateVersion = 6;

	};

	# Enable alternative shell support in nix-darwin.
	# programs.fish.enable = true;
}
