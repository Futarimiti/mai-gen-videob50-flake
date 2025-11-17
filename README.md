# mai-gen-videob50-flake

This is a Nix flake for
[mai-gen-videob50](https://github.com/Nick-bit233/mai-gen-videob50), providing a
`mai-gen-videob50` package, an app and a shell containing a Python 3.10
environment with required dependencies and some utilities. I had some nightmares
with Anaconda so I made this.

## Usage

```bash
nix run github:Futarimiti/mai-gen-videob50-flake
```

**NOTE** This fork modifies the app's behavior to make it compliant with Nix
packaging standards. The main changes include:

- The upstream writes generated files, configurations and downloads directly to
  the source directory at runtime. In this fork, all such files are written to a
  user-writable directory instead, by default `$XDG_DATA_HOME/mai-gen-videob50`
  but could be overriden by with `$MAI_GEN_DATA_DIR` environment variable. The
  directory will be automatically created if it doesn't exist.

- Changing theme at runtime is currently not supported. The upstream allows so
  by modifying options in `.streamlit/config.toml` in the source directory then
  re-run streamlit; which is impossible in this fork where the project directory
  will be in the read-only Nix store. I haven't yet found a viable workaround,
  so at this point it's left broken. If that bothers you, use `nix develop` to
  run in the source directory instead:

  ```bash
  git clone https://github.com/Futarimiti/mai-gen-videob50-flake.git
  cd mai-gen-videob50-flake
  nix develop -c streamlit run st_app.py
  ```
