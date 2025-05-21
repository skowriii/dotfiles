local border = "rounded"

local M = {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "*",
    opts = {
        keymap = { preset = "super-tab" },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono"
        },
        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
                "lazydev",
                "cmdline",
                "omni"
            },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100
                }
            }
        },
        completion = {
            accept = {
                auto_brackets = { enabled = true }
            },
            menu = {
                draw = {
                    columns = {
                        {
                            "label",
                            "label_description",
                            gap = 1
                        },
                        {
                            "kind_icon",
                            "kind",
                            gap = 1
                        }
                    }
                },
                border = border
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = {
                    border = border
                }
            },
            -- ghost_text = { enabled = true },
        },
        signature = {
            enabled = true,
            window = { border = border }
        }
    },
    opts_extend = { "sources.default" }
}

return { M }
