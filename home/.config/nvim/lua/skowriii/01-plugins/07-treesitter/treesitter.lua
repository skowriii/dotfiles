MiniMisc.safely("now",
    function()
        vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

        require("nvim-treesitter").install({
            "bash",
            "c",
            "cpp",
            "cmake",
            "diff",
            "doxygen",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "regex"
        })
    end
)
