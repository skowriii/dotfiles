local function update_colorcolumn()
    local min = 81
    local max = 121
    local target = vim.api.nvim_win_get_width(0)

    if target > max then
        target = max
    elseif target < min then
        target = min
    end

    vim.wo.colorcolumn = tostring(target)
end

update_colorcolumn()

vim.api.nvim_create_autocmd({ "VimResized", "WinEnter", "WinNew" }, {
    pattern = "*",
    callback = update_colorcolumn
})
