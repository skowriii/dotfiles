require("mini.base16").setup({
    palette = {
        base00 = "#0f1416",
        base01 = "#0a0f11",
        base02 = "#171c1f",
        base03 = "#40484c",
        base04 = "#bfc8cc",
        base05 = "#dee3e6",
        base06 = "#2c3134",
        base07 = "#353a3c",
        base08 = "#afb0e5",
        base09 = "#c2c3eb",
        base0A = "#b3cad4",
        base0B = "#87d1eb",
        base0C = "#424465",
        base0D = "#004e60",
        base0E = "#344a52",
        base0F = "#92b3c2",
    }
})

vim.api.nvim_set_hl(0, 'Visual', {
  bg = '#004e60',
  fg = '#0f1416',
})
