MiniDeps.now(
	function()
		MiniDeps.add({
			source = "stevearc/oil.nvim",
		})

		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"size",
				"icon"
			},
			buf_options = {
				buflisted = false,
				bufhidden = "hide"
			},
			delete_to_trash = false,
			prompt_save_on_select_new_entry = true,
			cleanup_delay_ms = false,
			constrain_cursor = "editable",
			watch_for_changes = true,
			use_default_keymaps = true,
			view_options = {
				show_hidden = true
			},
			float = {
				preview_split = "right"
			},
			preview_win = {
				update_on_cursor_moved = true,
				preview_method = "fast_scratch",
			}
		})
	end
)
