from decman import Module
from decman.plugins import pacman

class Virtualization(Module):
    def __init__(self):
        super().__init__("virtualization")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "dnsmasq",
            "iproute2",
            "libguestfs",
            "libvirt",
            "virt-manager"
        }
