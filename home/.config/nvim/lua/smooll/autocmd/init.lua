local modules = {
    "start_treesitter",
    "update_colorcolumn",
    "highlight_on_yank"
}

require("smooll.user.utils").bulk_require("smooll.autocmd", modules)
