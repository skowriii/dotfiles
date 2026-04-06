local modules = {
    "mini",
    "notify",
    "ai",
    "clue",
    "cursorword",
    "hipatterns",
    "icons",
    "indentscope",
    "misc",
    "trailspace"
}

require("smooll.user.utils").bulk_require("smooll.plugins.mini", modules)
