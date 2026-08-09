vim.pack.add({
    {
        src = "https://github.com/L3MON4D3/LuaSnip",
        version = vim.version.range("v2.*")
    }
})

local luasnip = require("luasnip")

luasnip.setup()
luasnip.filetype_extend("html", { "ejs" })
