hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + SHIFT + C", hl.dsp.window.kill())
hl.bind("SUPER + CTRL + SHIFT + M", hl.dsp.exit())
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + V", hl.dsp.window.float())
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + F1", hl.dsp.exec_cmd("~/.config/hypr/gamemode.sh"))

-- ss
hl.bind("SUPER +  CTRL + SHIFT + S", hl.dsp.global("ss:openSettings"))
hl.bind("SUPER + W", hl.dsp.global("ss:showIDs"))

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + h", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "d" }))

-- Move windows with mainMod + Shift + arrow keys
hl.bind("SUPER + SHIFT + h", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + SHIFT + l", hl.dsp.window.swap({ direction = "r" }))
hl.bind("SUPER + SHIFT + k", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + SHIFT + j", hl.dsp.window.swap({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1, follow = true }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2, follow = true }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3, follow = true }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4, follow = true }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5, follow = true }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6, follow = true }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7, follow = true }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8, follow = true }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9, follow = true }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10, follow = true }))

-- Example special workspace (scratchpad)
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl --player=kew,spotify next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl --player=kew,spotify play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl --player=kew,spotify play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl --player=kew,spotify previous"))

-- Requires hyprshot
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("SUPER + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Zoom
-- hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | \)
-- jq '.float * 1.1'))
-- hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | \)
-- jq '(.float * 0.9) | if . < 1 then 1 else . end'))
-- )
-- binde = "SUPER + SHIFT + equal", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | \)
-- jq '.float * 1.1'))
-- binde = "SUPER + SHIFT + minus", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | \)
-- jq '(.float * 0.9) | if . < 1 then 1 else . end'))
-- binde = "SUPER + SHIFT + KP_ADD", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | \)
-- jq '.float * 1.1'))
-- binde = "SUPER + SHIFT + KP_SUBTRACT", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | \)
-- jq '(.float * 0.9) | if . < 1 then 1 else . end'))
-- )
-- hl.bind("SUPER + SHIFT CTRL + mouse_up", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor 1)
-- hl.bind("SUPER + SHIFT CTRL + mouse_down", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor 1)
-- hl.bind("SUPER + SHIFT CTRL + minus", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor 1)
-- hl.bind("SUPER + SHIFT CTRL + KP_SUBTRACT", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor 1)
-- hl.bind("SUPER + SHIFT CTRL + 0", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor 1)
