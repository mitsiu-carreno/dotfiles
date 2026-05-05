{pkgs, ...}: {
  home.packages = [
    pkgs.presenterm
    pkgs.typst
    pkgs.pandoc
  ];

  xdg.configFile."presenterm/config.yaml".source = ./config/config.yaml;
  xdg.configFile."presenterm/themes/custom-dark.yaml".source = ./config/themes/custom-dark.yaml;
  #xdg.configFile."presenterm/themes/highlighting/Dracula.tmTheme".source = ./config/themes/highlighting/Dracula.tmTheme;
  xdg.configFile."presenterm/themes/highlighting/Nord.tmTheme".source = ./config/themes/highlighting/Nord.tmTheme;
  xdg.configFile."presenterm/themes/highlighting/Monokai_Bright.tmTheme".source = ./config/themes/highlighting/Monokai_Bright.tmTheme;

}
