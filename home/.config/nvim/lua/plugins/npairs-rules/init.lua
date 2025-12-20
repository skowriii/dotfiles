local modules = {
    "spaces-between",
    "fat-arrow",
    "angle-brackets"
}

require("user.utils").bulk_require("plugins.npairs-rules", modules)
