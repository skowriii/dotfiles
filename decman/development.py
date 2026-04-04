from decman import Module
from decman.plugins import pacman, aur

class Development(Module):
    def __init__(self):
        super().__init__("development")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "cmake",
            "gdb",
            "npm"
        }

    # @aur.packages
    # def aur_packages(self) -> set[str]:
    #     return { "visual-studio-code-bin" }
