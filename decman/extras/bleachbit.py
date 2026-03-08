from decman import Module, Symlink, prg
from decman.plugins import pacman

from common.globals import Globals

class Bleachbit(Module):
    def __init__(self):
        super().__init__("bleachbit")

    @pacman.packages
    def packages(self) -> set[str]:
        return { "bleachbit" }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/bleachbit":
                Symlink(target="/personal/dotfiles/home/.config/bleachbit",
                        owner=Globals.username)
        }
