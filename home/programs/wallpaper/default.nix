{ pkgs, ... }:
let
  wallp = ./hkr.png;

  setWallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
    /usr/bin/osascript -e "tell application \"System Events\" to tell every desktop to set picture to POSIX file \"${wallp}\""
  '';
in
{
  home.packages = [ setWallpaper ];

  launchd.agents.set-wallpaper = {
    enable = true;
    config = {
      ProgramArguments = [ "${setWallpaper}/bin/set-wallpaper" ];
      RunAtLoad = true;
    };
  };
}
