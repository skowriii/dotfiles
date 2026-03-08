from decman import Module
from decman.plugins import pacman

class Docker(Module):
    def __init__(self):
        super().__init__("docker")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "docker",
            "docker-compose"
        }
