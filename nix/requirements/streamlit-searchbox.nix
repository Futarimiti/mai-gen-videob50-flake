{
  buildPythonPackage,
  fetchurl,
  streamlit,
}:
buildPythonPackage {
  pname = "streamlit-searchbox";
  version = "0.1.23";
  format = "wheel";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/cc/9e/693acc67545940c328217bd19d693c80bcd2eaa55729701658d4e508cdb1/streamlit_searchbox-0.1.23-py3-none-any.whl";
    hash = "sha256-/oLO5IfFzdRdO/9tHYC0KW/9GJm1Xlfo8izOasx5BRg=";
  };
  propagatedBuildInputs = [ streamlit ];
}
