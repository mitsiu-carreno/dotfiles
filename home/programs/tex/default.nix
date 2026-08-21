{pkgs, ...}: {
  home.packages = [
    (pkgs.texliveSmall.withPackages (ps: with ps; [
      listings
      xcolor
    ]))
  ];
}
