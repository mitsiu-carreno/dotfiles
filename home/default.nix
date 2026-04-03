{ pkgs, ... }: {

	home.stateVersion = "25.11";

	programs.zsh.enable = true;

	imports = [
		./programs/neovim
    ./programs/git
	];
}
