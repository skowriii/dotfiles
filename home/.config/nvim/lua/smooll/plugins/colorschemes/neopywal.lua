MiniMisc.safely("now",
    function()
        vim.pack.add({
            {
                src = "https://github.com/RedsXDD/neopywal.nvim",
                name = "neopywal"
            }
        })

        require("neopywal").setup({ use_palette = "wallust" })

        vim.cmd.colorscheme("neopywal")
    end
)
