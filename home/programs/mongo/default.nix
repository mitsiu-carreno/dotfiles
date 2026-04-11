{pkgs, ...}: {
  home.packages = [
    pkgs.mongosh
    pkgs.mongodb-tools
  ];
}
