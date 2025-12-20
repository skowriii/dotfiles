require("user.utils").setup_capabilities("html")

vim.lsp.config("html", {
    filetypes = { "html", "templ", "ejs" }
})

vim.lsp.enable("html")
