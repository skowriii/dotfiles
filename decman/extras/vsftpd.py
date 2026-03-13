from decman import Module, File
from decman.plugins import pacman

from common.globals import Globals

class VSFTPD(Module):
    def __init__(self):
        super().__init__("VSFTPD")

    @pacman.packages
    def packages(self) -> set[str]:
        return { "vsftpd" }

    def files(self) -> dict[str, File]:
        return {
            "/etc/vsftpd.conf":
                File(source_file=f"{Globals.root_directory}/vsftpd.conf",
                     owner="root"),
            "/etc/vsftpd.userlist":
                File(source_file=f"{Globals.root_directory}/vsftpd.userlist",
                     owner="root")
        }
