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
    "css_variables"
}

require("user.utils").bulk_require("lsp", modules)
