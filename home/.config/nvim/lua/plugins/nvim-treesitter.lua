MiniDeps.now(
	function()
		MiniDeps.add({
			source = "nvim-treesitter/nvim-treesitter",
			checkout = "master",
			monitor = "main",
			hooks = {
				post_checkout = function()
					vim.cmd("TSUpdate")
				end
			}
		})

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"cpp",
				"c",
				"lua",
				"bash",
				"cmake",
				"markdown",
				"markdown_inline",
				"diff",
				"dockerfile",
				"doxygen",
				"python",
				"regex"
			},
			sync_install = true,
			auto_install = true,
			highlight = {
				enable = true
			},
			indent = {
				enable = false
			}
		})
	end
)
