{
  buildPythonPackage,
  fetchurl,
  aiohttp,
}:
buildPythonPackage {
  pname = "pytubefix";
  version = "9.5.1";
  format = "wheel";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/20/0f/d70f88d5193f8d47730ccd77a361b322db04d72d30593248ebe4bb1f2d96/pytubefix-9.5.1-py3-none-any.whl";
    sha256 = "03lq7ia1xa3f0lngjwcgz08pxirk5v64xrq48rwyv4li95xrs02c";
  };
  propagatedBuildInputs = [ aiohttp ];
}
