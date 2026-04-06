local modules = {
    "plugins",
    "user",
    "lsp",
    "autocmd"
}

require("smooll.user.utils").bulk_require("smooll", modules)
