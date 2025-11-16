# mai-gen-videob50-flake

This is a Nix flake for
[mai-gen-videob50](https://github.com/Nick-bit233/mai-gen-videob50), providing a
shell with a Python 3.10 environment with required dependencies and some
utilities. I had some nightmares with Anaconda so I made this.

## Running

```bash
git clone https://github.com/Futarimiti/mai-gen-videob50-flake.git
cd mai-gen-videob50-flake
nix develop -c streamlit run st_app.py
```

Optionally, use `--server.showEmailPrompt false` and
`--browser.gatherUsageStats false` to stop Streamlit from asking for email and
statistics.
