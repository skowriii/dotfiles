local modules = {
	"clangd",
	"bashls",
	"cmake",
	"lua_ls",
    "qmlls",
    "ts_ls",
    "zls",
    "pylsp",
    "html",
    "cssls",
    "css_variables",
    "hyprls"
}

require("smooll.user.utils").bulk_require("smooll.lsp", modules)
