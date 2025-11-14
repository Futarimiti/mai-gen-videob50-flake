{
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  streamlit,
}:
buildPythonPackage rec {
  pname = "streamlit-sortables";
  version = "0.3.1";
  pyproject = true;
  build-system = [ poetry-core ];
  src = fetchPypi {
    inherit version;
    pname = "streamlit_sortables";
    hash = "sha256-m+149EB/K5sd3q2LZFnRr4Oaq0J7e1/kwJHmhwYwrP4=";
  };
  propagatedBuildInputs = [ streamlit ];
}
