from decman import Module, Symlink
from decman.plugins import pacman, aur

from common.globals import Globals

class Apps(Module):
    def __init__(self):
        super().__init__("apps")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "btop",
            "fuzzel",
            "gimp",
            "inkscape",
            "kdenlive",
            "mpv",
            "ncdu"
        }

    @aur.packages
    def aur_packages(self) -> set[str]:
        return {
            # "pcsx2",
            "thorium-browser-bin"
        }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/btop":
                Symlink(target="/personal/dotfiles/home/.config/btop",
                        owner=Globals.username),
            f"/home/{Globals.username}/.config/fuzzel":
                Symlink(target="/personal/dotfiles/home/.config/fuzzel",
                        owner=Globals.username),
            f"/home/{Globals.username}/.config/mpv":
                Symlink(target="/personal/dotfiles/home/.config/mpv",
                        owner=Globals.username),
            f"/home/{Globals.username}/.config/ncdu":
                Symlink(target="/personal/dotfiles/home/.config/ncdu",
                        owner=Globals.username),
            # f"/home/{Globals.username}/.config/PCSX2":
            #     Symlink(target="/personal/dotfiles/home/.config/PCSX2",
            #             owner=Globals.username),
            f"/home/{Globals.username}/.config/thorium-flags.conf":
                Symlink(target="/personal/dotfiles/home/.config/thorium-flags.conf",
                        owner=Globals.username)
        }
