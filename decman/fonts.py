from decman import Module
from decman.plugins import pacman, aur

class Fonts(Module):
    def __init__(self):
        super().__init__("fonts")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "noto-fonts",
            "noto-fonts-cjk",
            "noto-fonts-emoji",
            "noto-fonts-extra",
            "ttf-jetbrains-mono-nerd"
        }
