{ pkgs, ... }: {

	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

	xdg.configFile."nvim/init.lua".source = ./config/init.lua;
	xdg.configFile."nvim/lua/options.lua".source = ./config/lua/options.lua;
	xdg.configFile."nvim/lua/keymaps.lua".source = ./config/lua/keymaps.lua; 
	
}
