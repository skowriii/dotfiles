import decman

from common.globals import Globals

from user import User
from builduser import BuildUser

from base import Base
from shell import Shell
from fonts import Fonts
from home import Home
from display_manager import DisplayManager
from desktop import Desktop
from audio import Audio
from bluetooth import Bluetooth
from printer import Printer
from apps import Apps
from terminal import Terminal
from development import Development
from gaming import Gaming

from extras.neovim import Neovim
from extras.vlc import VLC
from extras.obs import OBS
from extras.docker import Docker
from extras.plymouth import Plymouth
from extras.wine import Wine
from extras.virtualization import Virtualization
from extras.password_manager import PasswordManager
from extras.python import Python
from extras.vsftpd import VSFTPD
from extras.quickshell import Quickshell

from pacman_hooks import PacmanHooks
from systemd import Systemd

from flatpak import Flatpak

from extras.bleachbit import Bleachbit

User()
BuildUser()

# decman.aur.build_dir = "/var/tmp/decman"
decman.aur.makepkg_user = "builduser"

decman.execution_order = [
    "pacman",
    "aur",
    "flatpak",
    "files",
    "systemd"
]

decman.modules += [
    Globals.user_manager,
    Globals.gpg_receiver,

    Base(),
    Shell(),
    Fonts(),
    Home(),
    DisplayManager(),
    Desktop(),
    Audio(),
    Bluetooth(),
    Printer(),
    Apps(),
    Terminal(),
    Development(),
    Gaming(),

    Neovim(),
    VLC(),
    OBS(),
    Docker(),
    Plymouth(),
    Wine(),
    Virtualization(),
    PasswordManager(),
    Python(),
    VSFTPD(),
    Quickshell(),

    PacmanHooks(),
    Systemd(),

    Flatpak(),

    Bleachbit()
]
