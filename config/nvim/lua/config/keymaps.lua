-- Keymaps (migrated from vimrc)
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window navigation (matches tmux.conf)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Edit file in directory of current buffer
keymap("n", "<leader>ew", ":e <C-R>=expand('%:h').'/'<CR>", { noremap = true })
keymap("n", "<leader>es", ":sp <C-R>=expand('%:h').'/'<CR>", { noremap = true })
keymap("n", "<leader>ev", ":vsp <C-R>=expand('%:h').'/'<CR>", { noremap = true })
keymap("n", "<leader>et", ":tabe <C-R>=expand('%:h').'/'<CR>", { noremap = true })

-- Clear search highlighting
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Better up/down with wrapped lines
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor centered when scrolling
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Better indenting (stay in visual mode)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Paste without yanking in visual mode
keymap("v", "p", '"_dP', opts)

-- Quick save
keymap("n", "<leader>w", ":w<CR>", opts)

-- Quick quit
keymap("n", "<leader>q", ":q<CR>", opts)

-- Buffer navigation
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Terminal mode escape
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
