from decman import Module, Symlink
from decman.plugins import pacman

from common.globals import Globals

class Terminal(Module):
    def __init__(self):
        super().__init__("terminal")

        # key: terminal package name.
        # value: list of any dependencies, optional or not.
        self.terminals = {
            "alacritty": [""],
            "foot": ["foot-terminfo"]
        }

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            package
            for terminal, dependencies in self.terminals.items() if terminal == Globals.terminal
            for dependency in dependencies
            for package in (terminal, dependency)
        }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/{terminal}":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/{terminal}",
                        owner=Globals.username)
                for terminal in self.terminals if terminal == Globals.terminal
        }
