MiniDeps.add({
	source = "folke/lazydev.nvim"
})

require("lazydev").setup({
	ft = "lua",
	library = {
		{
			path = "${3rd}/luv/library",
			words = { "vim%.uv" }
		}
	}
})
