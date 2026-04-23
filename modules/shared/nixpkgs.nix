{ lib, ...}:
{
  nixpkgs.config = {
  allowUnfreePredicate = pkg:
    let name = lib.getName pkg;
    in builtins.elem name [
      "postman"
    ];
  };
}
