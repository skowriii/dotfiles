local builtin = require("telescope.builtin")

---------------------
-- NORMAL MODE       |
---------------------

-- Core
--------

-- Search
vim.keymap.set("n", "<ESC>", "<CMD>noh<CR>", { desc = "Clear search highlights" })

-- Buffers
vim.keymap.set("n", "<TAB>", "<CMD>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-TAB>", "<CMD>bprev<CR>", { desc = "Previous buffer" })

-- Plugins
--------------

-- trouble.nvim
vim.keymap.set("n", "<LEADER>td", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer diagnostics" })
vim.keymap.set("n", "<LEADER>ts", "<CMD>Trouble symbols toggle focus=false win.relative=win<CR>", { desc = "Symbols" })
vim.keymap.set("n", "<LEADER>tl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>", { desc = "LSP definitions" })
vim.keymap.set("n", "<LEADER>tL", "<CMD>Trouble loclist toggle<CR>", { desc = "Location list" })
vim.keymap.set("n", "<LEADER>tq", "<CMD>Trouble qflist toggle<CR>", { desc = "Quickfix list" })

-- todo-comments.nvim
vim.keymap.set("n", "<LEADER>tt", "<CMD>TodoTrouble toggle<CR>", { desc = "Open TODOs" })

-- Oil.nvim
vim.keymap.set("n", "<LEADER>fb", "<CMD>Oil --float --preview %:p:h<CR>", { desc = "Open file browser" })

-- telescope.nvim
vim.keymap.set("n", "<LEADER>bf", builtin.buffers, { desc = "Open buffer explorer" })
vim.keymap.set("n", "<LEADER>lg", builtin.live_grep, { desc = "Open Telescope live_grep" })

-- mini.trailspace
vim.keymap.set("n", "<LEADER>wt", function() MiniTrailspace.trim() end, { desc = "Trim trailing whitespace" })
vim.keymap.set("n", "<LEADER>elt", function() MiniTrailspace.trim_last_lines() end, { desc = "Trim trailing empty lines" })

----------------------------
-- NORMAL/VISUAL MODE       |
----------------------------

-- Core
--------

vim.keymap.set({ "x", "n" }, "<LEADER>p", "\"_dP", { desc = "Paste without overwriting the paste register" })
