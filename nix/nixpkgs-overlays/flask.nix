{
  buildPythonPackage,
  fetchurl,
  click,
  blinker,
  itsdangerous,
  jinja2,
  werkzeug,
  ...
}:
buildPythonPackage {
  pname = "flask";
  version = "3.1.2";
  format = "wheel";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/ec/f9/7f9263c5695f4bd0023734af91bedb2ff8209e8de6ead162f35d8dc762fd/flask-3.1.2-py3-none-any.whl";
    sha256 = "0g6hczlsjjlmgbdlqhbahif1n0ah6fb5hj7a5765hqcaxh9827fa";
  };
  propagatedBuildInputs = [
    click
    blinker
    itsdangerous
    jinja2
    werkzeug
  ];
}
