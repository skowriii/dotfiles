-- Float windows by class and resize them to 1280x720
local floating_classes = {
	"org.gnome.eog",
	"com.github.hluk.copyq",
	"nm-connection-editor",
	"blueman-manager",
	"xdg-desktop-portal-gtk",
	"thunar",
	"org.kde.ark",
	-- "thorium-browser"
}

hl.window_rule({
	match = { class = table.concat(floating_classes, '|') },
	float = true,
	persistent_size = true,
	max_size = { "1280", "720" }
})

-- Force windows to size 1280x720
local forced_classes = {
	"thunar"
}

hl.window_rule({
	match = { class = table.concat(forced_classes, '|') },
	size = { "1280", "720" }
})

-- Center the currently focused window
hl.window_rule({
	match = { focus = true },
	center = true
})

-- Open window on specified workspace
local workspace_apps = {
	[2] = { "zen" },
	[3] = { "(S|s)potify", "fl64.exe" },
	[4] = { "gimp", "org.inkscape.Inkscape", "Aseprite" },
	[6] = { "steam", "net.lutris.Lutris" },
	[7] = { "org.qbittorrent.qBittorrent", "com.github.wwmm.easyeffects" },
	[8] = { "com.discordapp.Discord" },
	[9] = { "com.obsproject.Studio" }
}

for workspace, classes in pairs(workspace_apps) do
	hl.window_rule({
		match = { class = table.concat(classes, '|') },
		workspace = workspace
	})
end

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
	match = { class = "^$" },
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

-- Render border on floating windows
hl.window_rule({
	match = { float = true },
	border_size = 3,
	rounding = 10
})

-- ss Rules
hl.window_rule({
	match = { initial_title = "^ss Settings$" },
	float = true
})

-- Float Zen Browser Library and resize to 1280x720
hl.window_rule({
	match = {
		class = "zen",
		initial_title = "^Biblioteka|Library$"
	},
	float = true,
	max_size = { "1280", "720" }
})

hl.window_rule({
	match = {
		class = "steam",
		initial_title = "negative:^Steam|$"
	},
	float = true,
	center = true,
	max_size = { "1280", "720" }
})
