-- Open app in a floating window
hl.window_rule({
    match = { class = "org.gnome.eog" },
    float = true
})
hl.window_rule({
    match = { initial_title = "^ss Settings$" },
    float = true
})

-- Open app on specified workspace
hl.window_rule({
    match = { class = "zen" },
    workspace = 2
})
hl.window_rule({
    match = { class = "Spotify" },
    workspace = 3
})
hl.window_rule({
    match = { class = "fl64.exe" },
    workspace = 3
})
hl.window_rule({
    match = { class = "gimp" },
    workspace = 4
})
hl.window_rule({
    match = { class = "org.inkscape.Inkscape" },
    workspace = 4
})
hl.window_rule({
    match = { class = "Aseprite" },
    workspace = 4
})
hl.window_rule({
    match = { class = "thunar" },
    workspace = 5
})
hl.window_rule({
    match = { class = "steam" },
    workspace = 6
})
hl.window_rule({
    match = { class = "net.lutris.Lutris" },
    workspace = 6
})
hl.window_rule({
    match = { class = "org.qbittorrent.qBittorrent" },
    workspace = 7
})
hl.window_rule({
    match = { class = "com.github.wwmm.easyeffects" },
    workspace = 7
})
hl.window_rule({
    match = { class = "com.discordapp.Discord" },
    workspace = 8
})
hl.window_rule({
    match = { class = "com.obsproject.Studio" },
    workspace = 9
})

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize"
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix-dragging-xwayland",

    match = {
        class = "^$",
        title = "^$",
        xwayland = "true",
        float = "true",
        fullscreen = "false",
        pin = "false"
    },

    no_focus = true
})

-- Prevent apps like hypridle from firing if the currently focused app is in fullscreen mode
hl.window_rule({
    match = { focus = true },
    idle_inhibit = "fullscreen"
})

-- Center the currently focused window
hl.window_rule({
    match = { focus = true },
    center = true
})
