from decman import Module, File, Symlink
from decman.plugins import pacman

from common.globals import Globals

class Quickshell(Module):
    def __init__(self):
        super().__init__("quickshell")

    @pacman.packages
    def packages(self) -> set[str]:
        return { "quickshell" }

    def files(self) -> dict[str, File]:
        return {
            "/usr/local/bin/sscli":
                File(source_file=f"{Globals.dotfiles_directory}/home/.config/quickshell/sS/sscli",
                     owner="root",
                     permissions=0o755)
        }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/quickshell/sS":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/quickshell/sS",
                        owner=Globals.username)
        }
