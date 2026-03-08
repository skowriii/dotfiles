from decman import Module, Directory
from decman.plugins import pacman, aur

class PacmanHooks(Module):
    def __init__(self):
        super().__init__("pacman_hooks")

    @pacman.packages
    def packages(self) -> set[str]:
        return { "python-requests" }

    @aur.packages
    def aur_packages(self) -> set[str]:
        return {
            "python-py-notifier"
        }

    def directories(self) -> dict[str, Directory]:
        return {
            "/etc/pacman.d/hooks":
                Directory(source_directory="/personal/dotfiles/etc/pacman.d/hooks",
                          owner="root")
        }
