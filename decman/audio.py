from decman import Module, Symlink
from decman.plugins import pacman, aur

from common.globals import Globals

class Audio(Module):
    def __init__(self):
        super().__init__("audio")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "audacity",
            "gst-plugin-pipewire",
            "kew",
            "libpulse",
            "pavucontrol",
            "picard",
            "pipewire",
            "pipewire-alsa",
            "pipewire-jack",
            "pipewire-pulse",
            "playerctl",
            "wireplumber"
        }

    @aur.packages
    def aur_packages(self) -> set[str]:
        return {
            "spotdl",
            "spotify",
            "spotify-adblock"
        }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/spotdl/config.json":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/spotdl/config.json",
                        owner=Globals.username)
        }
