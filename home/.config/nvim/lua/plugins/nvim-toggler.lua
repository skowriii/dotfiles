MiniDeps.add({
	source = "nguyenvukhang/nvim-toggler",
})

require("nvim-toggler").setup({
	inverses = {
		["OFF"] = "ON"
	}
})
