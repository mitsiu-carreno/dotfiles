{pkgs, ...}: {
  home.packages = [
    pkgs.smlnj
    (pkgs.writeShellScriptBin "mlton" ''
      exec ${pkgs.mlton}/bin/mlton "$@"
    '')
  ];
}
