local modules = {
    "angle-brackets",
    "fat-arrow",
    "spaces-between"
}

require("smooll.user.utils").bulk_require("smooll.plugins.autopairs.npairs_rules", modules)
