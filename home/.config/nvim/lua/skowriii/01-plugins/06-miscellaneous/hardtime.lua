MiniMisc.safely("now",
    function()
        vim.pack.add({
            "https://github.com/m4xshen/hardtime.nvim",
            "https://github.com/MunifTanjim/nui.nvim"
        })

        require("hardtime").setup({
            disable_mouse = true,
            timeout = 1000
        })
    end
)
