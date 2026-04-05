from decman import Module, prg
from decman.plugins import pacman, flatpak

from common.globals import Globals

class Flatpak(Module):
    def __init__(self):
        super().__init__("flatpak")

    @pacman.packages
    def packages(self) -> set[str]:
        return { "flatpak" }

    @flatpak.packages
    def flatpak_packages(self) -> set[str]:
        return { "com.discordapp.Discord" }

    def after_update(self, store):
        prg(["flatpak", "uninstall", "--unused"],
            user=Globals.username,
            pass_environment=True,
            mimic_login=True)
