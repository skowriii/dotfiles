local gamemode = require("land.02-extras.gamemode")
local zoom = require("land.02-extras.S-zoom")
local hyprshot_output_directory = "~/Obrazy"

hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + SHIFT + C", hl.dsp.window.close())
hl.bind("SUPER + CTRL + SHIFT + M", hl.dsp.exit())
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + V", hl.dsp.window.float())
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + F1",
    function()
        if not gamemode.enabled then
            gamemode.enable(nil, true)
        else
            gamemode.disable(nil, true)
        end
    end
)
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("zen-beta --name zen-beta"))
hl.bind("SUPER + down", hl.dsp.dpms({ action = "disable" }))
hl.bind("SUPER + up", hl.dsp.dpms({ action = "enable" }))
hl.bind("SUPER + M", hl.dsp.exec_cmd("markov-typing"))

-- ss
hl.bind("SUPER +  CTRL + SHIFT + S", hl.dsp.global("ss:openSettings"))
hl.bind("SUPER + W", hl.dsp.global("ss:showIDs"))
hl.bind("SUPER + W", hl.dsp.global("ss:showIDs"), { release = true })
hl.bind("SUPER + P", hl.dsp.global("ss:peekStatusBar"))
hl.bind("SUPER + P", hl.dsp.global("ss:peekStatusBar"), { release = true })
hl.bind("SUPER + F4", hl.dsp.global("ss:openPowerMenu"))

local directions = {
	["H"] = "l",
	["L"] = "r",
	["K"] = "u",
	["J"] = "d"
}

for bind, direction in pairs(directions) do
	-- Move focus with mainMod + arrow keys
	hl.bind("SUPER + " .. bind, hl.dsp.focus({ direction = direction }))

	-- Move windows with mainMod + Shift + arrow keys
	hl.bind("SUPER + SHIFT + " .. bind, hl.dsp.window.swap({ direction = direction }))
end

for i = 1, 10 do
	local workspace = i

	if workspace == 10 then
		workspace = 0
	end

	-- Switch workspaces with mainMod + [0-9]
	hl.bind("SUPER + " .. workspace, hl.dsp.focus({ workspace = i }))

	-- Move active window to a workspace with mainMod + SHIFT + [0-9]
	hl.bind("SUPER + SHIFT + " .. workspace, hl.dsp.window.move({ workspace = i, follow = true }))
end

-- Example special workspace (scratchpad)
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

-- Laptop multimedia keys for volume and LCD brightness
local multimedia_commands = {
	["XF86AudioRaiseVolume"] = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
	["XF86AudioLowerVolume"] = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
	["XF86AudioMute"] = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
	["XF86AudioMicMute"] = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
	["XF86MonBrightnessUp"] = "brightnessctl -e4 -n2 set 5%+",
	["XF86MonBrightnessDown"] = "brightnessctl -e4 -n2 set 5%-"
}

for bind, command in pairs(multimedia_commands) do
	hl.bind(
		bind,
		hl.dsp.exec_cmd(command),
		{
			repeating = true,
			locked = true
		}
	)
end

-- Requires playerctl
local players = "kew,spotify,jellyfin-tui,spotifyd"

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl --player=" .. players .. " next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl --player=" .. players .. " play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl --player=" .. players .. " play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl --player=" .. players .. " previous"), { locked = true })

-- Requires hyprshot
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("hyprshot -m window -o " .. hyprshot_output_directory))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -o " .. hyprshot_output_directory))
hl.bind("SUPER + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region -o " .. hyprshot_output_directory))

-- Zoom
hl.bind("SUPER + Z", zoom.zoom)
hl.bind("SUPER + mouse_down", function() zoom.zoom(0.5) end)
hl.bind("SUPER + mouse_up", function() zoom.zoom(-0.5) end)
