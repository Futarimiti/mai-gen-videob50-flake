{
  description = "Auto search and generate your best 50 videoes of MaimaiDX";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=b2a996d2314b5756dd39e01779708ea2f2e7f6f7";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = import ./nix/nixpkgs-overlays { };
        };
        python3 = pkgs.python310;
      in
      {
        devShells.default = import ./shell.nix { inherit pkgs python3; };
      }
    );
}
