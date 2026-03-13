from decman import Module, Symlink
from decman.plugins import pacman

from common.globals import Globals

class PasswordManager(Module):
    def __init__(self):
        super().__init__("password_manager")

    @pacman.packages
    def packages(self) -> set[str]:
        return { "pass" }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.password-store":
                Symlink(target=f"{Globals.root_directory}/.password-store",
                        owner=Globals.username)
        }
