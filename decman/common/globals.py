from decman.extras.users import UserManager
from decman.extras.gpg import GPGReceiver

class Globals():
    username = "skowriii"
    terminal = "foot"
    user_manager = UserManager()
    gpg_receiver = GPGReceiver()
    gpg_keys = [
        "95D2E9AB8740D8046387FD151A09227B1F435A33", # bdf-unifont
        "E1096BCBFF6D418796DE78515384CE82BA52C83A"  # Spotify
    ]
    root_directory = "/personal"
    dotfiles_directory = f"{root_directory}/dotfiles"
    nbfc_model = "HP ProBook 650 G2"
