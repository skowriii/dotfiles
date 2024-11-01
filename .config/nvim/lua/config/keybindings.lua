local function mapkey(mode, key, command, option)
  vim.api.nvim_set_keymap(mode, key, command, option)
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--[[ Normal Mode ]]
---- Exit NeoVim by pressing CTRL+Q
mapkey("n", "<C-q>", "<CMD>qa<CR>", { noremap = true, desc = "Quit NeoVim (all buffers)" })

-- Exit all windows and views by pressing SPACE+Q+A
mapkey("n", "<LEADER>q", "<CMD>qa!<CR>", { noremap = true, desc = "Quit NeoVim without saving (all buffers)" })

-- Close current buffer
mapkey("n", "<LEADER>bd", "<CMD>bdelete<CR>", { noremap = true, desc = "Quit file (delete buffer)" })

-- Save all files by pressing CTRL+S
mapkey("n", "<C-s>", "<CMD>wa<CR>", { noremap = true, desc = "Save all (buffers)" })

-- Source the current file
mapkey("n", "<LEADER>s", "<CMD>source %<CR>", { noremap = true, desc = "Source file currently edited" })

-- Find and replace
mapkey("n", "<LEADER>fr", ":%s/", { noremap = true, desc = "Find and replace in entire file" })

-->> START [ Split view commands ] <<--

-- Split view horizontally
mapkey("n", "<LEADER>sv", "<CMD>sv<CR>", { noremap = true, desc = "Split view horizontally" })

-- Split view vertically
mapkey("n", "<LEADER>vs", "<CMD>vsp<CR>", { noremap = true, desc = "Split view vertically" })

-- Change between splits (in order: up, down, left, right)
mapkey("n", "<LEADER>sck", "<CMD>wincmd k<CR>", { noremap = true, desc = "Move to split above current" })
mapkey("n", "<LEADER>scj", "<CMD>wincmd j<CR>", { noremap = true, desc = "Move to split below current" })
mapkey("n", "<LEADER>sch", "<CMD>wincmd h<CR>", { noremap = true, desc = "Move to split left of current" })
mapkey("n", "<LEADER>scl", "<CMD>wincmd l<CR>", { noremap = true, desc = "Move to split right of current" })

-->> END [ Split view commands ] <<--

-- Cycle to previous buffer
mapkey("n", "<S-TAB>", "<CMD>BufferLineCyclePrev<CR>", { noremap = true, desc = "Move to previous buffer" })

-- Cycle to next buffer
mapkey("n", "<TAB>", "<CMD>BufferLineCycleNext<CR>", { noremap = true, desc = "Move to next buffer" })

-- Open nvim-tree
mapkey("n", "<Leader>o", "<CMD>NvimTreeToggle<CR>", { noremap = true, desc = "Open/Close nvim-tree" })

-- Open todo-comments
mapkey("n", "<Leader>tt", "<CMD>TodoTrouble toggle<CR>", { noremap = true, desc = "Open/Close todo list" })

-- Trouble
mapkey("n", "<LEADER>xx", "<CMD>Trouble diagnostics toggle<CR>", { noremap = true, desc = "Diagnostics (Trouble)" })
mapkey("n", "<LEADER>xX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", { noremap = true, desc = "Buffer Diagnostics (Trouble)" })
mapkey("n", "<LEADER>cs", "<CMD>Trouble symbols toggle focus=false<CR>", { noremap = true, desc = "Symbols (Trouble)" })
mapkey("n", "<LEADER>cl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>", { noremap = true, desc = "LSP Definitions / references / ... (Trouble)" })
mapkey("n", "<LEADER>xL", "<CMD>Trouble loclist toggle<CR>", { noremap = true, desc = "Location List (Trouble)" })
mapkey("n", "<LEADER>xQ", "<CMD>Trouble qflist toggle<CR>", { noremap = true, desc = "Quickfix List (Trouble)" })

-- nvim-dap-ui
mapkey("n", "<LEADER>do", "<CMD>lua require(\"dapui\").open()<CR>", { noremap = true, desc = "Open debugger (dapui)" })
mapkey("n", "<LEADER>dc", "<CMD>lua require(\"dapui\").close()<CR>", { noremap = true, desc = "Close debugger (dapui)" })
mapkey("n", "<LEADER>dt", "<CMD>lua require(\"dapui\").toggle()<CR>", { noremap = true, desc = "Open/Close debugger (dapui)" })

-- nvim-dap
mapkey("n", "<F5>", "<CMD>lua require(\"dap\").continue()<CR>", { noremap = true, desc = "Continue to next breakpoint" })
mapkey("n", "<F10>", "<CMD>lua require(\"dap\").step_over()<CR>", { noremap = true, desc = "Step over expression" })
mapkey("n", "<F11>", "<CMD>lua require(\"dap\").step_into()<CR>", { noremap = true, desc = "Step into expression" })
mapkey("n", "<F12>", "<CMD>lua require(\"dap\").step_out()<CR>", { noremap = true, desc = "Step out of expression" })
mapkey("n", "<F9>", "<CMD>lua require(\"dap\").terminate()<CR>", { noremap = true, desc = "Terminate debugged application" })
mapkey("n", "<LEADER>b", "<CMD>lua require(\"dap\").toggle_breakpoint()<CR>", { noremap = true, desc = "Add/Remove breakpoint" })

-- Telescope
mapkey("n", "<LEADER>t", "<CMD>Telescope<CR>", { noremap = true, desc = "Open/Close Telescope" })
mapkey("n", "<LEADER>fb", "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true, desc = "Open file browser" })

-- Overseer
mapkey("n", "<LEADER>or", "<CMD>OverseerRun<CR>", { noremap = true, desc = "Run script" })
mapkey("n", "<LEADER>ot", "<CMD>OverseerToggle<CR>", { noremap = true, desc = "Open/Close Overseer" })

-- Navbuddy
mapkey("n", "<LEADER>n", "<CMD>Navbuddy<CR>", { noremap = true, desc = "Open Navbuddy" })

-- Arrow keys
mapkey("n", "<Up>", "<CMD>lua vim.notify('nuh uh. use k.')<CR>", { noremap = true })
mapkey("n", "<Down>", "<CMD>lua vim.notify('nuh uh. use j.')<CR>", { noremap = true })
mapkey("n", "<Left>", "<CMD>lua vim.notify('nuh uh. use h.')<CR>", { noremap = true })
mapkey("n", "<Right>", "<CMD>lua vim.notify('nuh uh. use l.')<CR>", { noremap = true })

-- which-key
mapkey("n", "<LEADER>?", "<CMD>lua require('which-key').show({ global = false})<CR>", { noremap = true, desc = "Buffer Local Keymaps (which-key)" })

--[[ Insert Mode ]]

-- Pressing CTRL+BACKSPACE will remove the word
mapkey("i", "<C-BS>", "<C-w>", { nil })
mapkey("i", "<C-h>", "<C-w>", { nil })
