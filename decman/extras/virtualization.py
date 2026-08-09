from decman import Module, prg
from decman.plugins import pacman, systemd

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
            "qemu-base",
            "virt-manager"
        }

    @systemd.units
    def units(self) -> set[str]:
        return { "libvirtd" }

    def on_enable(self, store):
        prg(["virsh", "net-start", "default"],
            user="root")

        prg(["virsh", "net-autostart", "default"],
            user="root")
