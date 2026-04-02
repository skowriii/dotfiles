from decman import Module, File
from decman.plugins import pacman, aur

class Gaming(Module):
    def __init__(self):
        super().__init__("gaming")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "gamemode",
            "steam"
        }

    @aur.packages
    def aur_packages(self) -> set[str]:
        return {
            "xpadneo-dkms"
        }

    def files(self) -> dict[str, File]:
        return {
            "/etc/modprobe.d/xpadneo.conf":
                File(content="options hid_xpadneo disable_shift_mode=Y",
                     owner="root")
        }
