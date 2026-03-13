import os

from decman import Module, File, Symlink, prg
from decman.plugins import pacman, aur

from common.globals import Globals

class Desktop(Module):
    def __init__(self):
        super().__init__("desktop")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            # DE/WM
            "hypridle",
            "hyprland",
            "hyprlock",
            "hyprpaper",
            "hyprpolkitagent",
            "hyprshot",
            "hyprsunset",
            "xdg-desktop-portal-gtk",
            "xdg-desktop-portal-hyprland",

            # QT6 theming engine
            "qt6ct",

            # File manager & Co.
            "ark",
            "ffmpegthumbnailer",
            "gvfs",
            "thunar",
            "thunar-archive-plugin",
            "tumbler",
            "xdg-utils",

            # Image viewer
            "eog",

            # Themes
            "breeze",
            "breeze-gtk",
            "breeze5",

            # Notifications
            "dunst",

            # Notepad
            "pluma",

            # Applets
            "network-manager-applet",

            # GTK theme configuration
            "nwg-look",

            # Screenshots
            "grim",
            "slurp",

            # Clipboard
            "copyq",
            "wl-clipboard",

            # Torrent client
            "qbittorrent",

            # Qt wayland support
            "qt5-wayland",
            "qt6-wayland"
        }

    @aur.packages
    def aur_packages(self) -> set[str]:
        return {
            # QT6 theming engine
            # "hyprqt6engine",

            # Wallpaper
            "awww-bin",
            "waypaper-git",

            # Themes
            "bibata-cursor-theme-bin",
            "kora-icon-theme",

            # Browser
            "zen-browser-bin"
        }

    def files(self) -> dict[str, File]:
        return {
            "/usr/local/bin/pwall":
                File(source_file=f"{Globals.root_directory}/Projects/Tools/Bash/PauseWallpaper/pwall",
                     owner="root",
                     permissions=0o755)
        }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/hypr":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/hypr",
                        owner=Globals.username),
            f"/home/{Globals.username}/.config/waypaper":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/waypaper",
                        owner=Globals.username),
            f"/home/{Globals.username}/wallpapers":
                Symlink(target=f"{Globals.dotfiles_directory}/home/wallpapers",
                        owner=Globals.username),
            f"/home/{Globals.username}/.zen":
                Symlink(target=f"{Globals.root_directory}/.zen",
                        owner=Globals.username)
        }
