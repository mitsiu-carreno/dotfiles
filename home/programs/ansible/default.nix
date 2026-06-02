{pkgs, ...}: {
  home.packages = [
    pkgs.ansible
    pkgs.qemu
  ];
}
