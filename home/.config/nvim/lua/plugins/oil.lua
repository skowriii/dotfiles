local M = {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		columns = {
			-- "permissions"
			"size",
			"mtime",
			"icon"
		},
		watch_for_changes = true,
		view_options = {
			show_hidden = true
		}
	}
}

return { M }
