from decman import Module
from decman.plugins import pacman

class VLC(Module):
    def __init__(self):
        super().__init__("VLC")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "vlc",
            "vlc-plugin-ffmpeg",
            "vlc-plugin-matroska",
            "vlc-plugin-x264",
            "vlc-plugin-x265"
        }
