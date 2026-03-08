from decman import Module, File, prg
from decman.plugins import pacman

class Plymouth(Module):
    def __init__(self):
        super().__init__("plymouth")

    @pacman.packages
    def packages(self) -> set[str]:
        return { "plymouth" }

    def files(self) -> dict[str, File]:
        return {
            "/etc/plymouth/plymouthd.conf":
                File(content="[Daemon]\nTheme=bgrt",
                     owner="root")
        }

    def on_change(self, store):
        prg(["mkinitcpio", "-p", "linux"],
            user="root",
            check=True)
