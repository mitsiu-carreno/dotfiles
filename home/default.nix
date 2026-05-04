{config, ...}: {
  home.stateVersion = "26.05";

  programs.zsh.enable = true;

  home.sessionVariables = {
    SOPS_AGE_KEY_FILE = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  };

  imports = [
    ./programs/neovim
    ./programs/git
    ./programs/podman
    ./programs/kitty
    ./programs/tree
    ./programs/mongo
    ./programs/ssh
    ./programs/keepassxc
    ./programs/sops
    ./programs/tealdeer
    ./programs/bruno
    ./programs/presenterm
  ];
}
