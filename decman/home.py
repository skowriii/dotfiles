from decman import Module, Symlink

from common.globals import Globals

class Home(Module):
    def __init__(self):
        super().__init__("home")

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.gnupg":
                Symlink(target="/personal/.gnupg",
                        owner=Globals.username),
            f"/home/{Globals.username}/.ssh":
                Symlink(target="/personal/.ssh",
                        owner=Globals.username),
            f"/home/{Globals.username}/docker":
                Symlink(target="/personal/docker",
                        owner=Globals.username),
            f"/home/{Globals.username}/dotfiles":
                Symlink(target="/personal/dotfiles",
                        owner=Globals.username),
            f"/home/{Globals.username}/Games":
                Symlink(target="/personal/Games",
                        owner=Globals.username),
            f"/home/{Globals.username}/Projects":
                Symlink(target="/personal/Projects",
                        owner=Globals.username)
        }
