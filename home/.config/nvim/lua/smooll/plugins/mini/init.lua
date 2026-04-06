local modules = {
    "mini",
    "notify",
    "ai",
    "clue",
    "cursorword",
    "hipatterns",
    "indentscope",
    "misc",
    "trailspace"
}

require("smooll.user.utils").bulk_require("smooll.plugins.mini", modules)
