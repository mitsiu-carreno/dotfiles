{pkgs, ...}: {
  home.packages = [
    pkgs.imagemagick    # magick
    pkgs.qpdf           # qpdf
    pkgs.poppler-utils  # pdfinfo | pdfunite
    pkgs.ghostscript    # gs
  ];
}
