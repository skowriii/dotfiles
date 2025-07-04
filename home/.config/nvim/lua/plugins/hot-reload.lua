local M = {
    "Zeioth/hot-reload.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "BufEnter",
    opts = function ()
        local config_dir = vim.fn.stdpath("config") .. "/lua/config/"
        return {
            reload_files = {
                config_dir .. "init.lua",
                config_dir .. "keybindings.lua",
                config_dir .. "lazy.lua",
                config_dir .. "options.lua"
            }
        }
    end
}

return { M }
