local modules = {
    "luasnip",
    "friendly-snippets",
    "lazydev",
    "mason",
    "nvim-cmp",
    "nvim-lspconfig"
}

require("smooll.user.utils").bulk_require("smooll.plugins.autocomplete", modules)
