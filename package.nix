{
  python3,
  stdenv,
  ffmpeg,
  bash,
  ...
}:
let
  python3Env = python3.withPackages (
    ps: import ./nix/requirements { python3Packages = ps; }
  );
in
stdenv.mkDerivation {
  pname = "mai-gen-videob50";
  version = "0.6.5";
  src = ./.;
  propagatedBuildInputs = [ ffmpeg ];
  installPhase = ''
    mkdir -p "$out/bin" "$out/share/mai-gen-videob50"
    cp -r . "$out/share/mai-gen-videob50"
    cat > "$out/bin/mai-gen-videob50" << EOF
    #!${bash}/bin/bash
    cd "$out/share/mai-gen-videob50"
    exec "${python3Env}/bin/streamlit" run st_app.py \
      --server.showEmailPrompt false \
      --browser.gatherUsageStats false
    EOF
    chmod +x "$out/bin/mai-gen-videob50"
  '';
}
