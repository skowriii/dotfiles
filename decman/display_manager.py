from decman import Module, File, prg
from decman.plugins import pacman, systemd

from common.globals import Globals

class DisplayManager(Module):
    def __init__(self):
        super().__init__("display_manager")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "ly"
        }

    def files(self) -> dict[str, File]:
        return {
            "/etc/ly/config.ini":
                File(source_file=f"{Globals.dotfiles_directory}/etc/ly/config.ini",
                     owner="root")
        }

    @systemd.units
    def units(self) -> set[str]:
        return {
            "ly@tty2.service"
        }
