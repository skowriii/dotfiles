local modules = {
    "hardtime",
    "render-markdown",
    "snacks",
    "todo-comments",
    "trouble"
}

require("smooll.user.utils").bulk_require("smooll.plugins.miscellaneous", modules)
