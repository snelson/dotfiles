-- Options (migrated from vimrc)
local opt = vim.opt

-- General
opt.mouse = "a"                          -- Enable mouse support
opt.clipboard = "unnamedplus"            -- Use system clipboard
opt.swapfile = false                     -- Don't use swapfile
opt.backup = false                       -- Don't create backup files
opt.writebackup = false                  -- Don't write backup
opt.undofile = true                      -- Persistent undo

-- UI
opt.number = true                        -- Show line numbers
opt.relativenumber = true                -- Relative line numbers
opt.signcolumn = "yes"                   -- Always show sign column
opt.cursorline = true                    -- Highlight current line
opt.termguicolors = true                 -- True color support
opt.showmode = false                     -- Don't show mode (shown in statusline)
opt.splitbelow = true                    -- Horizontal splits below
opt.splitright = true                    -- Vertical splits to the right
opt.scrolloff = 8                        -- Lines of context
opt.sidescrolloff = 8                    -- Columns of context

-- Search
opt.hlsearch = true                      -- Highlight search results
opt.ignorecase = true                    -- Ignore case in search
opt.smartcase = true                     -- Unless uppercase in search
opt.incsearch = true                     -- Incremental search

-- Tabs and indentation
opt.tabstop = 2                          -- 2 spaces for tab
opt.shiftwidth = 2                       -- 2 spaces for indent
opt.softtabstop = 2                      -- 2 spaces for tab in insert
opt.expandtab = true                     -- Use spaces instead of tabs
opt.smartindent = true                   -- Smart autoindenting
opt.autoindent = true                    -- Copy indent from current line

-- Line wrapping
opt.wrap = false                         -- Don't wrap lines

-- List characters (show invisible characters)
opt.list = true
opt.listchars = {
  tab = "  ",
  trail = ".",
  extends = ">",
  precedes = "<",
}

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10                       -- Popup menu height

-- Performance
opt.updatetime = 250                     -- Faster completion
opt.timeoutlen = 300                     -- Faster which-key popup

-- Backspace behavior
opt.backspace = { "indent", "eol", "start" }

-- Enable filetype detection
vim.cmd("filetype plugin indent on")
