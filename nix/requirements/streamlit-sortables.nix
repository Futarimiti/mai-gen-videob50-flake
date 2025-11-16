{
  buildPythonPackage,
  fetchurl,
  streamlit,
}:
buildPythonPackage {
  pname = "streamlit-sortables";
  version = "0.3.1";
  format = "wheel";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/3d/b4/edbef9fa8e49f5df2745a178c44b23553d8472c22fb23f44f6949d544410/streamlit_sortables-0.3.1-py3-none-any.whl";
    hash = "sha256-GEey+iBBditkQuISJL2MAxbFQS5Os6OPp0jPfO2DTUk=";
  };
  propagatedBuildInputs = [ streamlit ];
}
