local M = {}

M.max = 3
M.min = 1
M.toggle_factor = 1.5

function M.zoom(offset)
    local current = hl.get_config("cursor.zoom_factor")

    if offset ~= nil then
        current = current + offset
    elseif current ~= M.min then
        current = M.min
    else
        current = M.toggle_factor
    end

    current = math.max(M.min, math.min(M.max, current))

    hl.config({ cursor = { zoom_factor = current } })
end

return M
