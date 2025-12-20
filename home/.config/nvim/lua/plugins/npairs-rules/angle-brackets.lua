local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.add_rule(
    Rule("<", ">", {
        "-html",
        "-javascriptreact",
        "-typescriptreact"
    })
    :with_pair(
        cond.before_regex("%a+:?:?$", 3)
    )
    :with_move(function(opts)
        return opts.char == ">"
    end)
)
