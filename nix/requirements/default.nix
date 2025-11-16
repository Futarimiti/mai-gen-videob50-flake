{ python3Packages, ... }:
let
  ps = python3Packages;
  streamlit-sortables = ps.callPackage ./streamlit-searchbox.nix { };
  streamlit-searchbox = ps.callPackage ./streamlit-sortables.nix { };
in
[
  ps.bilibili-api-python
  ps.decorator
  ps.flask
  ps.httpx
  ps.lxml
  ps.numpy
  ps.pillow
  ps.pysocks
  ps.pyyaml
  ps.requests
  ps.socksio
  ps.tkinter
  ps.tqdm
  ps.watchdog
  ps.httplib2
  ps.imageio
  ps.moviepy
  ps.opencv-python-headless # no opencv-python in this release
  ps.pytubefix
  ps.streamlit
  streamlit-searchbox
  streamlit-sortables
]
