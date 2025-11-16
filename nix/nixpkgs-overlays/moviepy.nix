{
  buildPythonPackage,
  fetchurl,
  decorator,
  imageio,
  imageio-ffmpeg,
  numpy,
  proglog,
  requests,
  tqdm,
}:
buildPythonPackage {
  pname = "moviepy";
  version = "2.2.1";
  format = "wheel";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/9a/73/7d3b2010baa0b5eb1e4dfa9e4385e89b6716be76f2fa21a6c0fe34b68e5a/moviepy-2.2.1-py3-none-any.whl";
    sha256 = "0q2hg6rzms13pn1a53vr0f748r8f2v0nl4h4fialpi9axhzq0mkb";
  };
  propagatedBuildInputs = [
    decorator
    imageio
    imageio-ffmpeg
    numpy
    proglog
    requests
    tqdm
  ];
}
