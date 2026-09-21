hl.on("hyprland.start", function()
    -- Systemd stuff
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP QT_QPA_PLATFORMTHEME")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- Daemons
    hl.exec_cmd("udiskie -a")
    hl.exec_cmd("easyeffects --gapplication-service")

    -- Hyprland
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")

    -- Wallpaper
    hl.exec_cmd("waypaper --restore")
    -- hl.exec_cmd("pwall")

    -- Tray applets
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("copyq")

    -- Misc
    hl.exec_cmd("spotify")
end)
