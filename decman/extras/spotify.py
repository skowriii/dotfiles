from decman import Module, Symlink, prg
from decman.plugins import aur

from common.globals import Globals

class Spotify(Module):
    def __init__(self):
        super().__init__("spotify")

    @aur.packages
    def aur_packages(self) -> set[str]:
        return {
            "spicetify-bin",
            "spotify"
        }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/spicetify":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/spicetify",
                        owner=Globals.username)
        }

    def on_enable(self, store):
        prg(["mkdir", f"/home/{Globals.username}/.config/spotify"],
            user=Globals.username,
            mimic_login=True,
            check=False)

        with open(f"/home/{Globals.username}/.config/spotify/prefs", "a") as file:
            file.write("storage.size=4096")
            file.close()
        # prg(["echo", "storage.size=4096", ">>", f"/home/{Globals.username}/.config/spotify/prefs"],
        #     user=Globals.username,
        #     mimic_login=True,
        #     check=False)

        prg(["pipx", "install", "spotdl"],
            user=Globals.username,
            mimic_login=True)
