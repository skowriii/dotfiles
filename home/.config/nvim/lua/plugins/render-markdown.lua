MiniDeps.add({
	source = "MeanderingProgrammer/render-markdown.nvim",
	depends = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim"
	}
})

require("render-markdown").setup({
	completions = {
		lsp = {
			enabled = true
		}
	}
})
