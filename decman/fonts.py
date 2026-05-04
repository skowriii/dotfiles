from decman import Module
from decman.plugins import pacman, aur

class Fonts(Module):
    def __init__(self):
        super().__init__("fonts")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "ttf-montserrat", # Primary GUI font
            "ttf-jetbrains-mono-nerd", # Fallback for nerd font icons
            "noto-fonts",
            "noto-fonts-cjk",
            "noto-fonts-emoji",
            "noto-fonts-extra",
        }

    @aur.packages
    def aur_packages(self) -> set[str]:
        return {
            # Terminal font
            "cozette-otb",
            "cozette-ttf"
        }
