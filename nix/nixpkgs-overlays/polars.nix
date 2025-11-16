# polars-sql takes forever to build
{
  buildPythonPackage,
  fetchurl,
  stdenv,
  ...
}:
buildPythonPackage {
  pname = "polars";
  version = "1.7.1";
  format = "wheel";
  src = fetchurl (
    {
      aarch64-linux = {
        url = "https://files.pythonhosted.org/packages/a4/db/de0bcbb437e5246d6ae79c634b5b58167a978cef6cbfa66858174b8577a6/polars-1.7.1-cp38-abi3-manylinux_2_24_aarch64.whl";
        sha256 = "0pplpnjkpdsli2y19c15f4whl2jqay8bdbhbs52f5gj9kds5bhj5";
      };
      x86_64-linux = {
        url = "https://files.pythonhosted.org/packages/d5/f4/8cd6d454fcf6e1f5f0a17265a3acca19731f79c65c7432bafbb24492bf73/polars-1.7.1-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
        sha256 = "116plf99iwypzf2v8mkivn9fkadah99yd25nl5bxmch6lgj7bmjw";
      };
      aarch64-darwin = {
        url = "https://files.pythonhosted.org/packages/8a/2e/f34c0acdbfcd4c9a3cf21c1bf8ecacb68dae7147d0854b131feea027726d/polars-1.7.1-cp38-abi3-macosx_11_0_arm64.whl";
        sha256 = "0vhnrc7icnpbpfphpi4vc7ja42jrh3n1b2a9yiwmvv89s6lwqmf9";
      };
      x86_64-darwin = {
        url = "https://files.pythonhosted.org/packages/ae/53/7daa3dd2fd6d8728c3363b342fbf1f804a5612ecf33aef74fb63dea5e276/polars-1.7.1-cp38-abi3-macosx_10_12_x86_64.whl";
        sha256 = "1v9jiqbzgnsh3hrj2zjp2873m7n3rjz2q88kjz2g6rsikdd1p72q";
      };
    }
    .${stdenv.hostPlatform.system}
  );
  propagatedBuildInputs = [ ];
}
