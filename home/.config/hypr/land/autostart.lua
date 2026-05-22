hl.on("hyprland.start", function()
    -- Systemd stuff
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user import-environment QT_QPA_PLATFORMTHEME")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- Daemons
    -- hl.exec_cmd("playerctld daemon")
    hl.exec_cmd("udiskie -a")

    -- Hyprland
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic $cursor_size")
    hl.exec_cmd("hypridle")
    -- hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprsunset")

    -- Wallpaper
    hl.exec_cmd("waypaper --restore")
    hl.exec_cmd("pwall")

    -- Quickshell
    hl.exec_cmd("sscli s -a")

    -- Tray applets
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("copyq")

    -- Misc
    -- hl.exec_cmd("spotify")
    -- hl.exec_cmd("flatpak run com.discordapp.Discord")
    -- hl.exec_cmd("steam")
end)
