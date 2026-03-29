require("user.utils").setup_capabilities("pylsp")

vim.lsp.config("pylsp", {
    settings = {
        pylsp = {
            plugins = {
                mccabe = { enabled = false },
                pycodestyle = { enabled = false },
                pyflakes = { enabled = true }
            }
        }
    }
})

vim.lsp.enable("pylsp")
