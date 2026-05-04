{pkgs, ...}: {
  home.packages = [
    pkgs.presenterm
    pkgs.typst
    pkgs.pandoc
  ];

  xdg.configFile."presenterm/config.yaml".source = ./config/config.yaml;
  xdg.configFile."presenterm/themes/custom-dark.yaml".source = ./config/themes/custom-dark.yaml;
  xdg.configFile."presenterm/themes/highlighting/railsEnvy.tmTheme".source = ./config/themes/highlighting/railsEnvy.tmTheme;
  xdg.configFile."presenterm/themes/highlighting/dracula.tmTheme".source = ./config/themes/highlighting/dracula.tmTheme;
}
