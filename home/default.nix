{config, ...}: {
  home.stateVersion = "25.11";

  programs.zsh.enable = true;

  home.sessionPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];

  home.sessionVariables = {
    SOPS_AGE_KEY_FILE = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  };

  imports = [
    ./programs/neovim
    ./programs/git
    ./programs/podman
    ./programs/kitty
    ./programs/tree
    ./programs/desktoppr
    ./programs/mongo
    ./programs/ssh
    ./programs/keepassxc
    ./programs/sops
    ./programs/tealdeer
  ];
}
