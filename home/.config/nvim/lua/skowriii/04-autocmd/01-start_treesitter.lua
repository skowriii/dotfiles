vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if vim.treesitter.language.add(lang or args.match) then
            vim.treesitter.start(args.buf)
        end
    end
})
