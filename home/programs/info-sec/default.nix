{pkgs, ...}: {
  home.packages = [
    pkgs.wireshark
    pkgs.nmap
  ];
}
