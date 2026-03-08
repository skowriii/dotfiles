from decman import Module
from decman.plugins import pacman, aur

class Wine(Module):
    def __init__(self):
        super().__init__("wine")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "wine",
            "wine-mono",
            "winetricks"
        }

    @aur.packages
    def aur_packages(self) -> set[str]:
        return { "bottles" }
