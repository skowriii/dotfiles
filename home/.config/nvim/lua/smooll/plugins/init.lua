local modules = {
    "hooks",
    "mini",
    "autocomplete",
    "autopairs",
    "colorschemes",
    "file_explorers",
    "miscellaneous",
    "treesitter",
    "telescope"
}

require("smooll.user.utils").bulk_require("smooll.plugins", modules)
