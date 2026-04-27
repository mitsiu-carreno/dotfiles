{pkgs, ...}: let
  mfd-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "mfd.nvim";
    version = "2026-04-07";
    src = pkgs.fetchFromGitHub {
      owner = "kungfusheep";
      repo = "mfd.nvim";
      rev = "5d6067159e1b1116a12f34827a353572dbf3bdb9";
      sha256 = "sha256-CclZwmRKLabfpef/wS01AbhZ4AiS/WTP84hbtYUgqKc=";
    };
  };
in {
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
