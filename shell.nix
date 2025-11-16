{
  pkgs ? import <nixpkgs> { },
  python3 ? pkgs.python3,
}:
let
  python3Env = python3.withPackages (
    ps: import ./nix/requirements { python3Packages = ps; }
  );
in
pkgs.mkShell {
  packages = [
    python3Env
    python3Env.pkgs.ipython
    pkgs.ffmpeg
  ];
}
