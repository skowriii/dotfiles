from decman import Module, Symlink
from decman.plugins import pacman, aur

from common.globals import Globals

class Tmux(Module):
    def __init__(self):
        super().__init__("tmux")

    @pacman.packages
    def packages(self) -> set[str]:
        return { "tmux" }

    @aur.packages
    def aur_packages(self) -> set[str]:
        return { "smug-bin" }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.tmux.conf":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.tmux.conf",
                        owner=Globals.username),
            f"/home/{Globals.username}/.config/smug":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/smug",
                        owner=Globals.username)
        }
