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
            "/etc/pacman.conf":
                File(source_file=f"{Globals.dotfiles_directory}/etc/pacman.conf",
                     owner="root"),
            "/etc/kernel/cmdline":
                File(source_file=f"{Globals.dotfiles_directory}/etc/kernel/cmdline",
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
            "reflector.timer"
        }

    def on_enable(self, store):
        # Add !debug to makepkg.conf OPTIONS
        sh("""sed -i "/^OPTIONS=/ {
  /[[:space:]]debug[[:space:]]/ s/\\bdebug\\b/!debug/g
  /[[:space:]]!debug[[:space:]]/! s/^\\(OPTIONS=(.*\\))/\\1 !debug)/
}" /etc/makepkg.conf""",
           user="root",
           check=True)

        # Generate grub config
        prg(["grub-mkconfig", "-o", "/boot/grub/grub.cfg"],
            user="root",
            check=True)

        # Setup tmpfs on /tmp directory
        sh("echo 'tmpfs /tmp tmpfs defaults,noatime,mode=1777 0 0' | tee -a /etc/fstab",
           user="root",
           check=True)

        # Change mount options for /
        sh("""sed -i -E "s@^(UUID=[^[:space:]]+[[:space:]]+/[[:space:]]+ext4[[:space:]]+)[^[:space:]]+@\\1rw,relatime,lazytime,commit=60,journal_async_commit@" /etc/fstab""",
           user="root",
           check=True)

        # Generate UKI
        prg(["mkdir", "-p", "/boot/EFI/Linux"],
            user="root",
            check=True)

        prg(["mkinitcpio", "-p", "linux"],
            user="root",
            check=True)

        prg(["efibootmgr",
             "--create",
             "--disk", "/dev/nvme0n1",
             "--part", "1",
             "--label", """'Arch Linux'""",
             "--loader", """'\\EFI\\Linux\\arch-linux.efi'""",
             "--unicode"],
            user="root",
            check=True)

        # Setup git-webui
        sh("wget -O - https://raw.githubusercontent.com/alberthier/git-webui/master/install/installer.sh | bash",
           user=Globals.username,
           mimic_login=True,
           check=True)

        # Update nbfc configurations
        prg(["nbfc", "update"],
            user="root",
            check=True)

        # If the service is not running, nbfc will produce an error whether or not it applies the config
        # That's why check is set to False here, we don't want decman to crash for no reason.
        prg(["nbfc", "config", "-a", f"'{Globals.nbfc_model}'"],
            user="root",
            check=False)

        prg(["nbfc", "set", "-a"],
            user="root",
            check=False)

    def before_update(self, store):
        prg(["reflector",
             "--sort", "rate",
             "--latest", "10",
             "--country", "pl,de",
             "--save", "/etc/pacman.d/mirrorlist"],
            user="root",
            check=True)

    def after_update(self, store):
        directories = [entry.path for entry in os.scandir("/var/cache/pacman/pkg") if entry.is_dir()]
        if directories:
            print("Removing directories in pacman cache...")
            [ os.rmdir(directory) for directory in directories ]

        prg(["yay", "-Scc"],
            user=Globals.username,
            pass_environment=True,
            mimic_login=True,
            check=True)
