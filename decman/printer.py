from decman import Module
from decman.plugins import pacman, aur

class Printer(Module):
    def __init__(self):
        super().__init__("printer")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "cups",
            "cups-pk-helper",
            "system-config-printer"
            # "cups-pdf",
            # "foomatic-db-engine",
            # "foomatic-db-nonfree",
            # "gutenprint",
            # "simple-scan"
        }

    @aur.packages
    def aur_packages(self) -> set[str]:
        return { "canon-pixma-mg2500-complete" }
