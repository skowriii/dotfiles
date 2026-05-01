from decman import Module, Symlink

from common.globals import Globals

class Home(Module):
    def __init__(self):
        super().__init__("home")

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.gnupg":
                Symlink(target=f"{Globals.root_directory}/.gnupg",
                        owner=Globals.username),
            f"/home/{Globals.username}/.ssh":
                Symlink(target=f"{Globals.root_directory}/.ssh",
                        owner=Globals.username),
            f"/home/{Globals.username}/dotfiles":
                Symlink(target=f"{Globals.dotfiles_directory}",
                        owner=Globals.username),
            f"/home/{Globals.username}/Games":
                Symlink(target=f"{Globals.root_directory}/Games",
                        owner=Globals.username),
            f"/home/{Globals.username}/Projects":
                Symlink(target=f"{Globals.root_directory}/Projects",
                        owner=Globals.username)
        }
