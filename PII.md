# Post Installation Instructions
This document outlines manual intervention required after running decman for the first time.

> [!NOTE]
> These are in no particular order.

> [!NOTE]
> All commands in this document are ran by a regular user.

> [!CAUTION]
> Themes for certain apps are generated using [`wallust`](https://explosion-mental.codeberg.page/wallust/), and are
> .gitignore'd. If you decide to use this config, make sure to follow the [`Wallust`](#Wallust) section first.
>
> To see the list of apps for which themes are generated,
> look in [`/home/.config/wallust/templates`](home/.config/wallust/templates).

## Username
In case of a username change, be sure to update relevant configuration files:
- ~/.config/yay/config.json
- ~/.config/foot/foot.ini
- ~/.config/fuzzel/fuzzel.ini
- ~/.config/spotdl/config.json

## Wallust
```bash
wallust run </path/to/wallpaper> --no-hooks
```

## Spicetify
Log in to Spotify to generate files required by Spicetify, then run:

```bash
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
```

### Wallust Integration (Optional)
Create `~/.config/spicetify/Themes/text` and download
the [`text`](https://github.com/spicetify/spicetify-themes/tree/master/text) theme's
[`user.css`](https://github.com/spicetify/spicetify-themes/blob/master/text/user.css) file into it, then run:

```bash
spicetify config current_theme text color_scheme wallust
spicetify apply --no-restart
```

## Theming
### GTK
Run `nwg-look` and select the `wallust` theme.

### Qt
`hyprqt6engine` is already preconfigured to use the wallust theme, as such, no additional configuration is required.

## NetworkManager Connection
Change connection to `freeethernet` after logging into Hyprland for the first time and remove the default connection.
