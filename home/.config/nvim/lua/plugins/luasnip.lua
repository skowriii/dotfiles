MiniDeps.add({
    source = "L3MON4D3/LuaSnip",
    checkout = "v2.4.1",
    hooks = {
        post_install = function() vim.cmd("!make install_jsregexp") end
    }
})

require("luasnip").setup()
require("luasnip").filetype_extend("html", { "ejs" })
