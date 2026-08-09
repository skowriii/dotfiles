# Post Installation Instructions
This document outlines manual intervention required after running decman for the first time.

> [!NOTE]
> These are in no particular order.

> [!NOTE]
> All commands in this document are ran by a regular user.

## Username
In case of a username change, be sure to update relevant configuration files:
- ~/.config/yay/config.json
- ~/.config/foot/foot.ini
- ~/.config/fuzzel/fuzzel.ini
- ~/.config/spotdl/config.json
- ~/.config/waypaper/config.ini
- ~/.config/hypr/hyprqt6engine.conf

## Matugen
```bash
matugen image /path/to/wallpaper
```

## Spicetify
Log in to Spotify to generate files required by Spicetify, then run:

```bash
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify backup apply
```

## Theming
### GTK
Run `nwg-look` and select the `adw-gtk3` theme.

### Qt
`hyprqt6engine` is already preconfigured to use the matugen theme, as such, no additional configuration is required.

## NetworkManager Connection
Priority for `freeethernet` is set to 999, so it should connect automatically.
