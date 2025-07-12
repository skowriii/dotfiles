local modules = {
	"clangd",
	"bashls",
	"cmake",
	"lua_ls"
}

require("user.utils").bulk_require("lsp", modules)
