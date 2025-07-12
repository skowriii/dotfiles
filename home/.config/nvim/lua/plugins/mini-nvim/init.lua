local modules = {
	"ai",
	"basics",
	"clue",
	"comment",
	"cursorword",
	"diff",
	"extra",
	"git",
	"icons",
	"indentscope",
	"notify",
	"pairs",
	"pick",
	"statusline"
}

require("user.utils").bulk_require("plugins.mini-nvim", modules)
