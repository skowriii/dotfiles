from decman import Module
from decman.plugins import pacman

class Wine(Module):
    def __init__(self):
        super().__init__("wine")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "lutris",
            "wine",
            "wine-mono",
            "winetricks"
        }
