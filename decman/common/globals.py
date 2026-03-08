from decman.extras.users import UserManager
from decman.extras.gpg import GPGReceiver

class Globals():
    username = "smooll"
    terminal = "foot"
    user_manager = UserManager()
    gpg_receiver = GPGReceiver()
    gpg_keys = [
        "95D2E9AB8740D8046387FD151A09227B1F435A33", # bdf-unifont
        # "8048643BA2C840F4F92A195FF54984BFA16C640F", # (lib32-)libpng12
        "E1096BCBFF6D418796DE78515384CE82BA52C83A"  # Spotify
    ]
