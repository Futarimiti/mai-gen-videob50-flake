{
  pkgs ? import <nixpkgs> { },
  python3 ? pkgs.python3,
  ...
}:
pkgs.callPackage ./package.nix { inherit python3; }
