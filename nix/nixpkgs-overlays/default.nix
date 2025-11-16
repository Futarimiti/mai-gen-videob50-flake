{ ... }:
let
  pythonPackagesOverlay = self: super: {
    pythonPackagesExtensions = super.pythonPackagesExtensions ++ [
      (
        pyself: pysuper:
        let
          noChecks =
            ps:
            builtins.listToAttrs (
              map (name: {
                inherit name;
                value = pysuper.${name}.overrideAttrs {
                  doInstallCheck = false;
                };
              }) ps
            );
          usePrebuilt =
            ps:
            builtins.listToAttrs (
              map (name: {
                inherit name;
                value = pyself.callPackage ./${name}.nix { };
              }) ps
            );
        in
        noChecks [
          "aiohttp"
          "astropy"
          "falcon"
          "fasteners"
          "httplib2"
          "jupyter-console"
          "nbconvert"
          "numcodecs"
          "prometheus-client"
          "pytest-httpserver"
          "smbprotocol"
          "sqlalchemy"
          "websocket-client"
        ]
        // usePrebuilt [
          "polars"
          "moviepy"
          "pytubefix"
          "streamlit"
          "flask"
        ]
        // {
          dask-expr = pysuper.dask-expr.overrideAttrs (old: {
            src = self.fetchFromGitHub {
              owner = "dask";
              repo = "dask-expr";
              rev = "refs/tags/v${old.version}";
              hash = "sha256-HHoUQ6LfrlUnZNvvbPbQbNW6WLabGa88RsC9M8hlARI="; # fixing hash
            };
          });
        }
      )
    ];
  };
in
[ pythonPackagesOverlay ]
