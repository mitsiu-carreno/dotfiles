{ pkgs, ... }:

let
  hostGL = package: executable:
    pkgs.symlinkJoin {
      name = "${package.pname or package.name}-host-gl";
      paths = [package];

      nativeBuildInputs = [pkgs.makeWrapper];

      postBuild = ''
        wrapProgram $out/bin/${executable} \
          --prefix LD_LIBRARY_PATH : /usr/lib64 \
          --prefix LIBGL_DRIVERS_PATH : /usr/lib64/dri \
          --prefix GBM_BACKENDS_PATH : /usr/lib64/gbm
      '';
    };
in {
  programs.kitty.package = hostGL pkgs.kitty "kitty";

  home.packages = [
    (hostGL pkgs.bruno "bruno")
  ];
}
