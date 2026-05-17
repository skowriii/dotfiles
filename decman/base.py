import os

from decman import Module, File, Symlink, sh, prg
from decman.plugins import pacman, aur, systemd

from common.globals import Globals

class Base(Module):
    def __init__(self):
        super().__init__("base")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "amd-ucode",
            "archlinux-contrib",
            "base",
            "base-devel",
            "brightnessctl",
            "cpupower",
            "curl",
            "efibootmgr",
            "git",
            "grub",
            "gzip",
            "irqbalance",
            "lib32-vulkan-radeon",
            "linux",
            "linux-firmware",
            "linux-headers",
            "linux-zen",
            "linux-zen-headers",
            "mold",
            "networkmanager",
            "pacman-contrib",
            "pacutils",
            "reflector",
            "tar",
            "thermald",
            "udiskie",
            "unzip",
            "vulkan-radeon",
            "wget",
            "xf86-video-vesa",
            "zram-generator"
        }

    @aur.packages
    def aur_packages(self) -> set[str]:
        return {
            "decman",
            "downgrade",
            "informant",
            "nbfc-linux",
            "nohang-git",
            "yay-bin",
        }

    def files(self) -> dict[str, File]:
        return {
            "/etc/default/cpupower-service.conf":
                File(source_file=f"{Globals.dotfiles_directory}/etc/default/cpupower-service.conf",
                     owner="root"),
            "/etc/default/grub":
                File(source_file=f"{Globals.dotfiles_directory}/etc/default/grub",
                     owner="root"),
            "/etc/systemd/zram-generator.conf":
                File(source_file=f"{Globals.dotfiles_directory}/etc/systemd/zram-generator.conf",
                     owner="root"),
            "/etc/mkinitcpio.conf":
                File(source_file=f"{Globals.dotfiles_directory}/etc/mkinitcpio.conf",
                     owner="root"),
            "/etc/mkinitcpio.d/linux.preset":
                File(source_file=f"{Globals.dotfiles_directory}/etc/mkinitcpio.d/linux.preset",
                     owner="root"),
            "/etc/mkinitcpio.d/linux-zen.preset":
                File(source_file=f"{Globals.dotfiles_directory}/etc/mkinitcpio.d/linux-zen.preset",
                     owner="root"),
            "/etc/pacman.conf":
                File(source_file=f"{Globals.dotfiles_directory}/etc/pacman.conf",
                     owner="root"),
            "/etc/makepkg.conf":
                File(source_file=f"{Globals.dotfiles_directory}/etc/makepkg.conf",
                     owner="root"),
            "/etc/kernel/cmdline":
                File(source_file=f"{Globals.dotfiles_directory}/etc/kernel/cmdline",
                     owner="root"),
            "/etc/sysctl.d/80-swappiness.conf":
                File(content="vm.swappiness = 10",
                     owner="root"),
            "/etc/NetworkManager/system-connections/freeethernet.nmconnection":
                File(source_file=f"{Globals.root_directory}/freeethernet.nmconnection",
                     owner="root",
                     group="root",
                     permissions=0o600),
            "/usr/local/bin/change-brightness":
                File(source_file=f"{Globals.dotfiles_directory}/usr/local/bin/change-brightness",
                     owner="root",
                     permissions=0o755),
            "/usr/local/bin/check-kernel-version":
                File(source_file=f"{Globals.dotfiles_directory}/usr/local/bin/check-kernel-version",
                     owner="root",
                     permissions=0o755),
            "/usr/local/bin/fix-usb-wakeup":
                File(source_file=f"{Globals.dotfiles_directory}/usr/local/bin/fix-usb-wakeup",
                     owner="root",
                     permissions=0o755)
        }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/yay":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/yay",
                        owner=Globals.username),
            f"/home/{Globals.username}/.gitconfig":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.gitconfig",
                        owner=Globals.username)
        }

    @systemd.units
    def units(self) -> set[str]:
        return {
            "cpupower.service",
            "nbfc_service.service",
            "nohang-desktop.service",
        }

    def before_update(self, store):
        kernel_outdated = prg([f"{Globals.dotfiles_directory}/usr/local/bin/check-kernel-version"],
                              user=Globals.username,
                              pass_environment=True,
                              mimic_login=True).strip()

        if kernel_outdated != "":
            prg(["reflector",
                 "--sort", "rate",
                 "--latest", "10",
                 "--country", "pl,de",
                 "--save", "/etc/pacman.d/mirrorlist"],
                user="root")

    def after_update(self, store):
        directories = [entry.path for entry in os.scandir("/var/cache/pacman/pkg") if entry.is_dir()]
        if directories:
            print("Removing directories in pacman cache...")
            [ os.rmdir(directory) for directory in directories ]

        prg(["yay", "-Scc"],
            user=Globals.username,
            pass_environment=True,
            mimic_login=True)
