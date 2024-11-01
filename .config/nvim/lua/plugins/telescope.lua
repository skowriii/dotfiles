require("telescope").setup({
    extensions = {
        file_browser = {
            hijack_netrw = true,
            hidden = { file_browser = true, folder_browser = true }
        }
    }
})

require("telescope").load_extension("file_browser")
