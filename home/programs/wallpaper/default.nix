{ pkgs, ... }: 
let 
  wallpName = ./hkr.png;
in
{

  programs.desktoppr = {
    enable = true;
    settings = {
      picture = wallpName;
    };
  };
}
