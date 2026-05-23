from decman import Module
from decman.plugins import aur

class Rivalcfg(Module):
    def __init__(self):
        super().__init__("rivalcfg")

    @aur.packages
    def aur_packages(self) -> set[str]:
        return { "rivalcfg" }
