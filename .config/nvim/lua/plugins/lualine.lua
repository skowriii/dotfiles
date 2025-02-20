local M = {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "catppuccin",
            component_separators = "",
            section_separators = {
                left = "",
                right = ""
            }
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    separator = { left = "" },
                    right_padding = 2
                }
            },
            lualine_b = {
                "filename",
                "branch"
            },
            lualine_c = { "%=" },
            lualine_x = {},
            lualine_y = {
                "filetype",
                "progress"
            },
            lualine_z = {
                {
                    "location",
                    separator = { right = "" },
                    left_padding = 2
                }
            }
        },
        inactive_sessions = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" }
        },
        tabline = {
            lualine_a = { "buffers" }
        },
        extensions = {}
    }
}

return { M }
