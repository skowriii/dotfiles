local modules = {
	"mini-nvim",
	"oil",
	"nvim-treesitter",
	"render-markdown",
	"mason",
	"nvim-lspconfig",
	"lazydev",
	-- "blink-cmp",
	"trouble",
	"todo-comments",
	"hardtime",
	"nvim-toggler",
    "nvim-autopairs",
    "npairs-rules",
    "nvim-ts-autotag",
    "lspkind",
    "nvim-cmp",
    "luasnip",
    "friendly-snippets",
    "neopywal"
}

require("user.utils").bulk_require("plugins", modules)
