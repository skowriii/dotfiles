import os

from decman import Module
from decman.extras.users import User

from common.globals import Globals

class BuildUser(Module):
    def __init__(self):
        super().__init__("builduser")

        Globals.user_manager.add_user(User(
            username="builduser",
            home="/var/lib/builduser",
            system=True
        ))

        for gpg_key in Globals.gpg_keys:
            Globals.gpg_receiver.receive_key(
                user="builduser",
                gpg_home="/var/lib/builduser/gnupg",
                fingerprint=gpg_key,
                keyserver="hkps://keyserver.ubuntu.com"
            )

        os.environ["GNUPGHOME"] = "/var/lib/builduser/gnupg"
