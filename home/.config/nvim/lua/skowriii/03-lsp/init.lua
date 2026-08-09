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
    "hyprls",
    "svelte"
}

require("skowriii.02-user.S-utils").bulk_require("skowriii.03-lsp")
