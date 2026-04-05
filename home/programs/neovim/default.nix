{ pkgs, ... }:
let
  mfd-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "mfd.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "kungfusheep";
      repo = "mfd.nvim";
      rev = "master";
      sha256 = "sha256-MXarF5J+r654B6W+AzIzNgvWzCaYfTPWQnVfPmMfcA8=";
    };
  };
in
{

	programs.neovim = {
		enable = true;
		defaultEditor = true;

    plugins = [
      mfd-nvim
    ];
	};

	xdg.configFile."nvim/init.lua".source = ./config/init.lua;
	xdg.configFile."nvim/lua/options.lua".source = ./config/lua/options.lua;
	xdg.configFile."nvim/lua/keymaps.lua".source = ./config/lua/keymaps.lua; 
	
}
