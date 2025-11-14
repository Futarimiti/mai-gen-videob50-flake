{
  description = "Auto search and generate your best 50 videoes of MaimaiDX";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?rev=fada7b290b2aae7f50f31a5b6854ce4a305ccf23";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pyVersion = "312";
        pythonPackagesOverlay = self: super: {
          pythonPackagesExtensions = super.pythonPackagesExtensions ++ [
            (pyself: pysuper: {
              streamlit-sortables = pyself.callPackage ./nix/streamlit-sortables.nix { };
              streamlit-searchbox = pyself.callPackage ./nix/streamlit-searchbox.nix { };
            })
          ];
        };
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ pythonPackagesOverlay ];
        };
        python = pkgs."python${pyVersion}";
        pyDeps =
          pypkgs: with pypkgs; [
            bilibili-api-python
            decorator
            flask
            httplib2
            httpx
            imageio
            lxml
            moviepy
            numpy
            opencv-python
            pillow
            pysocks
            pytubefix
            pyyaml
            requests
            streamlit
            streamlit-sortables
            streamlit-searchbox
            tkinter
            tqdm
            watchdog
          ];
      in
      let
        pyEnv = python.withPackages pyDeps;
      in
      {
        inherit pkgs;
        packages = rec {
          mai-gen-videob50 = pkgs.stdenv.mkDerivation {
            pname = "mai-gen-videob50";
            version = "0.6.5";
            src = ./.;
            buildInputs = [ pyEnv ];
            propagatedBuildInputs = [ pkgs.ffmpeg-full ];
            installPhase = ''
              mkdir -p $out/bin $out/share/mai-gen-videob50
              cp -r . $out/share/mai-gen-videob50
              cat > $out/bin/mai-gen-videob50 << EOF
              #!${pkgs.bash}/bin/bash
              cd $out/share/mai-gen-videob50
              exec ${pyEnv}/bin/streamlit run st_app.py --server.showEmailPrompt false
              EOF
              chmod +x $out/bin/mai-gen-videob50
            '';
          };
          default = mai-gen-videob50;
        };
        apps = rec {
          mai-gen-videob50 = flake-utils.lib.mkApp {
            drv = self.packages.${system}.mai-gen-videob50;
          };
          default = mai-gen-videob50;
        };
        devShells.default = pkgs.mkShell {
          packages = [
            pyEnv
            python.pkgs.ipython
            pkgs.ffmpeg-full
          ];
        };
      }
    );
}
