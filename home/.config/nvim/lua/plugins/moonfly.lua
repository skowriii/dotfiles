local M = {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.g.moonflyNormalFloat = true
        vim.g.moonflyVirtualTextColor = true
        vim.g.moonflyWinSeparator = 2
        vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }

        vim.o.winborder = "single"

        vim.cmd.colorscheme("moonfly")
    end
}

return { M }
