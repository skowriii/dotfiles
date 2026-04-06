vim.pack.add({ "https://github.com/windwp/nvim-autopairs" })

require("nvim-autopairs").setup({
    map_c_h = true,
    map_c_w = true,
    fast_wrap = {}
})
