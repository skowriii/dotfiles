MiniDeps.now(
	function()
		MiniDeps.add({
			source = "m4xshen/hardtime.nvim",
			depends = { "MunifTanjim/nui.nvim" }
		})

		require("hardtime").setup({
			disable_mouse = false,
			timeout = 1000
		})
	end
)
