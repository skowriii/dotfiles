local M = {}

M.pwall_pid = ""
M.pwall_used = false
M.file = "/tmp/hyprgamemode"
M.enabled = false
M.classes = {
    "steam_proton",
    "steam_app_.*",
    "steam_appid_.*",
    ".*_steam_x64",
    "gamescope",
    "Wine",
    "wine",
    ".*%.exe"
}

function M.save()
    local file = io.open(M.file, 'w')
    if file then
        if M.enabled then
            file:write("yes\n")
        else
            file:write("no\n")
        end

        if M.pwall_used then
            file:write("yes\n")
        else
            file:write("no\n")
        end

        file:close()
    end
end

function M.load()
    local file = io.open(M.file, 'r')
    if file then
        local gamemode, pwall = file:read("*l", "*l")
        if gamemode == "yes" then
            M.enabled = true
        elseif gamemode == "no" then
            M.enabled = false
        end

        if pwall == "yes" then
            M.pwall_used = true
        elseif pwall == "no" then
            M.pwall_used = false
        end

        if not gamemode or not pwall then
            hl.notification.create({
                text = "Something went wrong while reading " .. M.file .. '!',
                icon = "error",
                timeout = 5000
            })
        end

        file:close()
    end
end

function M.handle_pwall_pid()
    local handle = io.popen("pgrep -f -l pwall | grep bash | awk '{ print $1 }'")
    if handle then
        M.pwall_pid = handle:read("*l") or ""
        if M.pwall_pid ~= "" then
            M.pwall_used = true
        else
            M.pwall_used = false
        end

        handle:close()
    end
end

function M.check_if_window_has_class(window)
    for _, class in ipairs(M.classes) do
        if window.class and window.class:find(class) then
            return true
        end
    end

    return false
end

function M.find_game(window)
    if window then
        if M.check_if_window_has_class(window) then
            return true
        end

        return false
    end

    for _, win in ipairs(hl.get_windows()) do
        if M.check_if_window_has_class(win) then
            return true
        end
    end

    return false
end

function M.enable(window, force)
    if M.find_game(window) or force then
        if M.pwall_used then
            hl.exec_cmd("kill -TERM " .. M.pwall_pid)
            hl.exec_cmd("awww kill")
        end

        hl.config({
            animations = { enabled = false },
            decoration = {
                shadow = { enabled = false },
                blur = { enabled = false },
                glow = { enabled = false },
                fullscreen_opacity = 1,
                rounding = 0
            },
            general = {
                gaps_in = 0,
                gaps_out = 0,
                border_size = 0
            }
        })

        M.enabled = true

        M.save()

        hl.notification.create({ text = "GameMode enabled", color = "#22aa22", timeout = 5000 })

        return
    end
end

function M.disable(window, force)
    if M.enabled or force then
        if not M.find_game(window) then
            if M.pwall_used then
                hl.exec_cmd("waypaper --restore")
                hl.exec_cmd("pwall")
            end

            M.enabled = false

            M.save()

            hl.exec_cmd("hyprctl reload")

            hl.notification.create({ text = "GameMode disabled", color = "#aa2222", timeout = 5000 })

            return
        end
    end
end

hl.on("hyprland.start",
    function()
        M.load()
        M.handle_pwall_pid()
    end
)

hl.on("hyprland.shutdown",
    function()
        M.save()
        M.handle_pwall_pid()
    end
)

hl.on("config.reloaded",
    function()
        M.load()
        M.handle_pwall_pid()
        M.enable()
        M.disable()
    end
)

hl.on("window.open_early",
    function(window)
        M.enable(window)
    end
)

hl.on("window.destroy",
    function(window)
        M.disable(window)
    end
)

return M
