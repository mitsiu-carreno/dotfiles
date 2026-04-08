{ pkgs, ... }: {

	home.stateVersion = "25.11";

	programs.zsh.enable = true;

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
    #./programs/infisical
	];
}
