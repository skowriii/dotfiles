local modules = {
    "autopairs",
    "npairs_rules",
    "ts-autotag"
}

require("smooll.user.utils").bulk_require("smooll.plugins.autopairs", modules)
