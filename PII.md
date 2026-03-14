# Post Installation Instructions
This document outlines manual intervention required after Decman is ran for the first time.

> [!NOTE]
> These are in no particular order.

## Spicetify
Login to Spotify to generate files required by Spicetify, then run:

```bash
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
```

## Theming
Update GTK theme using `nwg-look` and QT6 theme by updating `color_scheme` variable in `home/.config/hypr/hyprqt6engine.conf`.

## NetworkManager Connection
Change connection to `freeethernet` after logging into Hyprland for the first time and remove the default connection.
