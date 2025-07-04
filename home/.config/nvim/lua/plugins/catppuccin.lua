local M = {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
        color_overrides = {
            all = {
                rosewater = "#e8bab2",
                flamingo = "#e39d9e",
                pink = "#ef96d9",
                mauve = "#ac6ced",
                red = "#e55887",
                maroon = "#da7387",
                peach = "#f18f4e",
                yellow = "#eac161",
                green = "#7ac075",
                teal = "#67beb0",
                sky = "#59bccd",
                sapphire = "#4caad2",
                blue = "#528ff2",
                lavender = "#8792fd",
                text = "#a8b7eb",
                subtext1 = "#afb8d8",
                subtext0 = "#a3aac6",
                overlay2 = "#8990a9",
                overlay1 = "#71768d",
                overlay0 = "#595d71",
                surface2 = "#373948",
                surface1 = "#2c2d3b",
                surface0 = "#1b1b27",
                base = "#000000",
                mantle = "#050505",
                crust = "#050505",
            }
        },
        custom_highlights = function (colors)
            return {
                BlinkCmpMenu = { fg = colors.crust },
                BlinkCmpDoc = { fg = colors.crust },
                BlinkCmpSignatureHelp = { fg = colors.crust },
                BlinkCmpMenuBorder = { bg = colors.crust },
                BlinkCmpDocBorder = { bg = colors.crust },
                BlinkCmpSignatureHelpBorder = { bg = colors.crust },
                BlinkCmpMenuSelection = { bg = colors.surface0 },
                BlinkCmpScrollbarThumb = { bg = colors.overlay0 },
            }
        end,
        integrations = {
            blink_cmp = true,
            notify = true,
            lsp_trouble = true,
            mason = true
        }
    }
}

return { M }
