import decman

from decman import Module

from extras.docker import Docker

from common.globals import Globals

class User(Module):
    def __init__(self):
        super().__init__("user")

        if Docker in decman.modules:
            Globals.user_manager.add_user_to_group(Globals.username, "docker")

        Globals.user_manager.add_user_to_group(Globals.username, "informant")
