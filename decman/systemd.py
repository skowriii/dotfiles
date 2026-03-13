from decman import Module, File, Symlink
from decman.plugins import systemd

from common.globals import Globals

class Systemd(Module):
    def __init__(self):
        super().__init__("systemd")

    def files(self) -> dict[str, File]:
        return {
            "/etc/systemd/system/fix-usb-wakeup.service":
                File(source_file=f"{Globals.dotfiles_directory}/etc/systemd/system/fix-usb-wakeup.service",
                     owner="root")
        }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/systemd/user/change-brightness.service":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/systemd/user/change-brightness.service",
                        owner=Globals.username),
            f"/home/{Globals.username}/.config/systemd/user/change-brightness.timer":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/systemd/user/change-brightness.timer",
                        owner=Globals.username),
            f"/home/{Globals.username}/.config/systemd/user/check-kernel-version.service":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/systemd/user/check-kernel-version.service",
                        owner=Globals.username),
            f"/home/{Globals.username}/.config/systemd/user/check-kernel-version.timer":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/systemd/user/check-kernel-version.timer",
                        owner=Globals.username)
        }

    @systemd.units
    def units(self) -> set[str]:
        return { "fix-usb-wakeup.service" }

    @systemd.user_units
    def user_units(self) -> dict[str, set[str]]:
        return {
            Globals.username: { "change-brightness.timer", "check-kernel-version.timer" }
        }
