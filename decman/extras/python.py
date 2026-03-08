from decman import Module
from decman.plugins import pacman

class Python(Module):
    def __init__(self):
        super().__init__("python")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "python",
            "python-pip",
            "python-pipx"
        }
