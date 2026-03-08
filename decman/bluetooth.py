from decman import Module, File
from decman.plugins import pacman, systemd

class Bluetooth(Module):
    def __init__(self):
        super().__init__("bluetooth")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "blueman",
            "bluez",
            "bluez-utils"
        }

    def files(self) -> dict[str, File]:
        return {
            "/etc/modprobe.d/bluetooth.conf":
                File(content="options bluetooth disable_ertm=Y",
                     owner="root")
        }

    @systemd.units
    def units(self) -> set[str]:
        return { "bluetooth.service" }
