MiniDeps.now(
    function()
        MiniDeps.add({
            source = "RedsXDD/neopywal.nvim",
            name = "neopywal"
        })

        require("neopywal").setup({
            use_palette = "wallust"
        })

        vim.cmd.colorscheme("neopywal")
    end
)
