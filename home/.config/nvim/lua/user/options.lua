local global = vim.g
local option = vim.opt

-- Leader key
global.mapleader = " "
global.maplocalleader = "\\"

-- General
option.clipboard = "unnamedplus"					  -- Copy/Paste to clipboard
option.completeopt = "menu,preview,noinsert,noselect" -- Autocomplete
option.equalalways = true							  -- Windows are automatically made the same size
option.hidden = true								  -- Don't unload inactive buffers
option.history = 100								  -- Remember n lines in history
option.lazyredraw = true							  -- Don't redraw while executing macros
option.list = true									  -- Show Tab and EOL
option.listchars:append "eol:↴"						  -- Change EOL to '↴'
option.listchars:append "space:⋅"					  -- Change space to '⋅'
option.loadplugins = true							  -- Load plugin scripts when starting up
option.mouse = "nv"									  -- Enable mouse
option.swapfile = false								  -- Disable creation of backup files
option.synmaxcol = 100								  -- Maximum column to find syntax items
option.timeoutlen = 1000							  -- Time to wait for mapped sequence to complete (in ms)
option.updatetime = 250								  -- Number of ms to wait for before triggering an event

-- UI
option.background = "dark"	 -- Set highlight colors
option.cursorline = true	 -- Highlight current line
option.number = true		 -- Show line number
option.numberwidth = 1		 -- Number of columns used for line number
option.relativenumber = true -- Show relative line number in front of each line
option.showmatch = true		 -- Highlight matching parenthesis
option.termguicolors = true	 -- Enable 24-bit RGB color
option.wrap = true			 -- Long lines wrap and continue on the next line

-- Tabs
local tabs = 4

option.autoindent = true  -- Automatically indent new lines
option.expandtab = true  -- Use spaces when tab is inserted
option.shiftwidth = tabs  -- Number of spaces to use for (auto)indent step
option.softtabstop = tabs -- Number of spaces, a tab counts for while editing
option.tabstop = tabs 	  -- Number of spaces, a tab counts for
option.smartindent = true -- Indent new lines

-- Indents
option.breakindent = true -- Wrapped line repeats indent

-- Searching
option.hlsearch = true   -- Highlight searched words
option.ignorecase = true -- Ignore case in search patterns
option.showmatch = true  -- Show matching words

-- Status line
option.ruler = true -- Show cursor line and column

-- Other
vim.filetype.add({
    extension = {
        tpp = "cpp"
    }
})

option.iskeyword:remove('_')
