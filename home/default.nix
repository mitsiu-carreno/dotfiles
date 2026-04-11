{pkgs, ...}: {
  home.stateVersion = "25.11";

  programs.zsh.enable = true;

  home.sessionPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];

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
  ];
}
