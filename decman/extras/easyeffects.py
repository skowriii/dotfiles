from decman import Module, Symlink
from decman.plugins import pacman

from common.globals import Globals

class EasyEffects(Module):
    def __init__(self):
        super().__init__("easyeffects")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "calf",
            "easyeffects",
            "lsp-plugins-lv2",
            "mda.lv2",
            "zam-plugins-lv2",
            "zita-convolver"
        }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/easyeffects":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/easyeffects",
                        owner=Globals.username)
        }
