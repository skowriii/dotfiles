from decman import Module, prg
from decman.plugins import pacman

from common.globals import Globals

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

    def on_enable(self, store):
        prg(["pipx", "ensurepath"],
            user=Globals.username,
            mimic_login=True,
            pass_environment=True)
