# mai-gen-videob50-flake

This is a Nix flake for
[mai-gen-videob50](https://github.com/Nick-bit233/mai-gen-videob50), providing a
`mai-gen-videob50` package, an app and a dev shell containing python 3.12
environment with required dependencies. I had some nightmares with anaconda so I
made this.

## NOTE

The original mai-gen-videob50 would write generated files, configurations and
downloads directly under the project directory. This works when running the
app inside a cloned repo, but immediately breaks in immutable environments
like Nix, where the store is read-only.

This fork patches the source code throughout to redirect all data files
to a user-writable directory. By default that would be

```
$XDG_DATA_HOME/mai-gen-videob50
```

You can override that by specifying the `$MAI_GEN_DATA_DIR` environment
variable. The directory will be automatically created if doesn't exist.

## Running

```bash
nix run github:Futarimiti/mai-gen-videob50-flake
```

## Known issues

- [ ] Changing themes is not possible since that would need to change
      `.streamlit/config.toml` which is immutable in the store
- [ ] Cannot login to bilibili due to
      `module 'bilibili_api.login_v2' has no attribute 'login_with_qrcode'`
- [ ] Cannot download videos due to
      `'VideoDownloadURLDataDetecter' object has no attribute 'check_flv_stream'`
- [ ] Cannot render video due to permission denied for creating audio file in
      project root
