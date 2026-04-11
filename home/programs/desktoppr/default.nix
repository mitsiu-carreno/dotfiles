{pkgs, ...}: let
  wallp = ./observer.png;
in {
  programs.desktoppr = {
    enable = true;
    settings.picture = wallp;
  };

  launchd.agents.set-wallpaper = {
    enable = true;
    config = {
      ProgramArguments = [
        "${pkgs.desktoppr}/bin/desktoppr"
        "${wallp}"
      ];
      RunAtLoad = true;
    };
  };
}
