MiniDeps.add({
	source = "neovim/nvim-lspconfig",
    depends = { "WhoIsSethDaniel/mason-tool-installer.nvim" }
})

require("mason-tool-installer").setup({
    ensure_installed = {
        "bash-language-server",
        "clangd",
        -- "cmake-language-server",
        "css-variables-language-server",
        "html-lsp",
        "hyprls",
        "lua-language-server",
        "python-lsp-server",
        "qmlls",
        "typescript-language-server"
    },
    auto_update = true,
    debounce_hours = 8
})
