from decman.extras.users import UserManager
from decman.extras.gpg import GPGReceiver

class Globals():
    username = "skowriii"
    terminal = "foot"
    user_manager = UserManager()
    gpg_receiver = GPGReceiver()
    gpg_keys = [
        "E1096BCBFF6D418796DE78515384CE82BA52C83A" # spotify
    ]
    root_directory = "/personal"
    dotfiles_directory = f"{root_directory}/dotfiles"
    nbfc_model = "HP ProBook 650 G2"
