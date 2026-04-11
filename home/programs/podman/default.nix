{pkgs, ...}: {
  home.packages = [pkgs.podman];

  xdg.configFile."containers/registries.conf".text = ''
    [registries.search]
    registries = ["docker.io", "quay.io", "ghcr.io"]
  '';
}
