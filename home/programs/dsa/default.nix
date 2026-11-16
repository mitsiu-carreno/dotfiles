{pkgs, ...}: {
  home.packages = [
    pkgs.smlnj
    pkgs.elmPackages.elm
    (pkgs.writeShellScriptBin "mlton" ''
      exec ${pkgs.mlton}/bin/mlton "$@"
    '')
  ];
}
