from decman import Module
from decman.plugins import pacman, aur

class OBS(Module):
    def __init__(self):
        super().__init__("OBS")

    @pacman.packages
    def packages(self) -> set[str]:
        return { "obs-studio" }

    @aur.packages
    def aur_packages(self) -> set[str]:
        return { "wlrobs-hg" }
