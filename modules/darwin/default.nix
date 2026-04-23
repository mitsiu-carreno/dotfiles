{
  pkgs,
  username,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
    ./homebrew.nix
    ../shared/nixpkgs.nix
  ];

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
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 30d";
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
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
        show-recents = false;
        tilesize = 20;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        ShowPathbar = true;
        FXPreferredViewStyle = "clmv";
        _FXShowPosixPathInTitle = true;
      };
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        KeyRepeat = 2;
      };

      # Required to allow window snapping via fn+ctrl
      spaces.spans-displays = false;

      trackpad = {
        Clicking = true;
        Dragging = true;
        DragLock = false;
        TrackpadPinch = true;
        TrackpadThreeFingerHorizSwipeGesture = 2;
      };

      hitoolbox.AppleFnUsageType = null;

      loginwindow.GuestEnabled = false;

      menuExtraClock.ShowSeconds = true;

      controlcenter = {
        BatteryShowPercentage = true;
        Bluetooth = false;
      };
    };

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;
  };

  programs.zsh.promptInit = ''
    autoload -Uz vcs_info
    precmd() { vcs_info }

    zstyle ':vcs_info:git:*' formats ' %%F{green}(%b)%%f'
    zstyle 'vcs_info:*' enable git

    setopt PROMPT_SUBST
    PROMPT='%n@%1~''${vcs_info_msg_0_}$ '
  '';

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;
}
