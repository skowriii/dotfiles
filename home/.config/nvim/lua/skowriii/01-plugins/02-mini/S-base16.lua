require("mini.base16").setup({
    palette = {
        base00 = "#131318",
        base01 = "#0d0e13",
        base02 = "#1b1b21",
        base03 = "#46464f",
        base04 = "#c7c5d0",
        base05 = "#e4e1e9",
        base06 = "#303036",
        base07 = "#39393f",
        base08 = "#dfa7cc",
        base09 = "#e6bad7",
        base0A = "#c4c5dd",
        base0B = "#bbc3ff",
        base0C = "#5d3c54",
        base0D = "#3b4279",
        base0E = "#434559",
        base0F = "#a4a5ca",
    }
})

vim.api.nvim_set_hl(0, 'Visual', {
  bg = '#3b4279',
  fg = '#131318',
})
