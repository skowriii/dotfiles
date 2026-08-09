from decman import Module
from decman.plugins import pacman

class Cloudflare(Module):
    def __init__(self):
        super().__init__("cloudflare")

    @pacman.packages
    def packages(self) -> set[str]:
        return {
            "cloudflared",
            "wrangler"
        }
