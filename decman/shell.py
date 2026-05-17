from decman import Module, Symlink, sh
from decman.plugins import pacman

from common.globals import Globals

class Shell(Module):
    def __init__(self):
        super().__init__("shell")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "zsh",

            # Replacements of built-in commands
            "bat", # cat
            "duf", # df
            "eza", # ls
            "ugrep", # grep
            "zoxide", # cd
            "nawk", # awk

            # Man pages
            "man-db",
            "man-pages",
            "man-pages-pl",

            # Archiving
            "unrar",
            "zip",

            # Miscellaneous
            "aria2",
            "fastfetch",
            "fzf",
            "rsync",
            "socat",
            "task",
            "tealdeer"
        }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.zsh":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.zsh",
                        owner=Globals.username),
            f"/home/{Globals.username}/.zshrc":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.zshrc",
                        owner=Globals.username),
            f"/home/{Globals.username}/.task":
                Symlink(target=f"{Globals.root_directory}/.task",
                        owner=Globals.username)
        }

    def on_enable(self, store):
        sh("curl -fsSL https://install.ohmyz.sh | CHSH=no sh -s -- --unattended --keep-zshrc",
           user=Globals.username,
           mimic_login=True)

        sh(f"chsh -s $(which zsh) {Globals.username}",
           user="root")
