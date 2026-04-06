local modules = {
    "luasnip",
    "telescope-fzf-native",
    "treesitter"
}

require("smooll.user.utils").bulk_require("smooll.plugins.hooks.PackChanged", modules)
