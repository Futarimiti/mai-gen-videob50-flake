{
  buildPythonPackage,
  fetchPypi,
  setuptools,
  streamlit,
}:
buildPythonPackage rec {
  pname = "streamlit-searchbox";
  version = "0.1.23";
  pyproject = true;
  build-system = [ setuptools ];
  src = fetchPypi {
    inherit version;
    pname = "streamlit_searchbox";
    hash = "sha256-ty3ggp07li8NRo0RFbc4eWB4csWcepdkK6ujQ1Q/GFY=";
  };
  propagatedBuildInputs = [ streamlit ];
}
