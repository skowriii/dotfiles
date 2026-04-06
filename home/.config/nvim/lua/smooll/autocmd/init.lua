local modules = {
    "start_treesitter",
    "update_colorcolumn"
}

require("smooll.user.utils").bulk_require("smooll.autocmd", modules)
