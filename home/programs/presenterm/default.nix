{pkgs, ...}: {
  home.packages = [
    pkgs.presenterm
    pkgs.typst
    pkgs.pandoc
    pkgs.python313Packages.weasyprint
    pkgs.dejavu_fonts
  ];

  xdg.configFile."presenterm/config.yaml".source =
    pkgs.replaceVars ./config/config.yaml {
      dejavuFontDir = "${pkgs.dejavu_fonts}/share/fonts/truetype";
    };
  #xdg.configFile."presenterm/config.yaml".source = ./config/config.yaml;
  xdg.configFile."presenterm/themes/custom-dark.yaml".source = ./config/themes/custom-dark.yaml;
  xdg.configFile."presenterm/themes/highlighting/Dracula.tmTheme".source = ./config/themes/highlighting/Dracula.tmTheme;
  xdg.configFile."presenterm/themes/highlighting/Nord.tmTheme".source = ./config/themes/highlighting/Nord.tmTheme;
  xdg.configFile."presenterm/themes/highlighting/Monokai.tmTheme".source = ./config/themes/highlighting/Monokai.tmTheme;

}
