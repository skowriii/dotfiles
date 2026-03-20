local modules = {
	"clangd",
	"bashls",
	"cmake",
	"lua_ls",
    "qmlls",
    "ts_ls",
    -- "zls",
    "pylsp",
    "html",
    "cssls",
    "css_variables",
    "hyprls"
}

require("user.utils").bulk_require("lsp", modules)
