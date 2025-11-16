{
  buildPythonPackage,
  fetchurl,
  altair,
  blinker,
  cachetools,
  click,
  gitpython,
  numpy,
  watchdog,
  packaging,
  pandas,
  pillow,
  protobuf,
  pyarrow,
  pydeck,
  requests,
  rich,
  tenacity,
  toml,
  tornado,
  typing-extensions,
  stdenv,
  lib,
}:
buildPythonPackage {
  pname = "streamlit";
  version = "1.51.0";
  format = "wheel";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/39/60/868371b6482ccd9ef423c6f62650066cf8271fdb2ee84f192695ad6b7a96/streamlit-1.51.0-py3-none-any.whl";
    sha256 = "0f6srww7fm9429qdnj5v5ijzgx1n7rm9mc3bjiacw08lywlv0220";
  };
  propagatedBuildInputs = [
    altair
    blinker
    cachetools
    click
    numpy
    packaging
    pandas
    pillow
    protobuf
    pyarrow
    requests
    rich
    tenacity
    toml
    typing-extensions
    gitpython
    pydeck
    tornado
  ]
  ++ lib.optionals (!stdenv.hostPlatform.isDarwin) [ watchdog ];
}
