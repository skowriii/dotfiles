from decman import Module, Symlink
from decman.plugins import aur

from common.globals import Globals

class OpenTabletDriver(Module):
    def __init__(self):
        super().__init__("OpenTabletDriver")

    @aur.packages
    def aur_packages(self) -> set[str]:
        return { "opentabletdriver" }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/OpenTabletDriver/Plugins":
                Symlink(target="/personal/dotfiles/home/.config/OpenTabletDriver/Plugins",
                        owner=Globals.username),
            f"/home/{Globals.username}/.config/OpenTabletDriver/Presets":
                Symlink(target="/personal/dotfiles/home/.config/OpenTabletDriver/Presets",
                        owner=Globals.username),
            f"/home/{Globals.username}/.config/OpenTabletDriver/settings.json":
                Symlink(target="/personal/dotfiles/home/.config/OpenTabletDriver/settings.json",
                        owner=Globals.username),
        }
