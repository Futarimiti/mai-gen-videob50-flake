import os
from pathlib import Path

def app_data_dir() -> Path:
    """
    Return a data directory for mai-gen-videob50 to use.
    By default this would be $XDG_DATA_HOME/mai-gen-videob50,
    with $XDG_DATA_HOME default to ~/.local/share.
    This is overridable by setting the environment variable $MAI_GEN_DATA_DIR.
    The directory will be created if does not exist.
    """
    base = os.environ.get(
        "MAI_GEN_DATA_DIR",
        default=os.path.join(
            os.environ.get(
                "XDG_DATA_HOME",
                default=os.path.expanduser("~/.local/share")
            ),
            "mai-gen-videob50"
        )
    )
    os.makedirs(base, exist_ok=True)
    return Path(base)
