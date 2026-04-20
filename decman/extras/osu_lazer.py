from decman import Module
from decman.plugins import aur

class OSULazer(Module):
    def __init__(self):
        super().__init__("osu_lazer")

    @aur.packages
    def aur_packages(self) -> set[str]:
        return { "osu-lazer-bin" }
