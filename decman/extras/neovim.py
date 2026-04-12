from decman import Module, Symlink, sh
from decman.plugins import pacman, aur

from common.globals import Globals

class Neovim(Module):
    def __init__(self):
        super().__init__("neovim")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "neovim",
            "tree-sitter-cli",
            "ripgrep"
        }

    def symlinks(self) -> dict[str, Symlink]:
        return {
            f"/home/{Globals.username}/.config/nvim":
                Symlink(target=f"{Globals.dotfiles_directory}/home/.config/nvim",
                        owner=Globals.username)
        }

    def after_update(self, store):
        sh("""nvim --headless "+lua vim.pack.update()" +w +qall""",
           user=Globals.username,
           mimic_login=True,
           check=False)
