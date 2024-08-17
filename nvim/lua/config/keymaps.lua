local keymap = vim.keymap -- for concisness
local keyopts = { noremap = true, silent = true }

-- Navigate buffers
keyopts.desc = "Next Buffer"
keymap.set("n", "<S-l>", ":bnext<CR>", keyopts)

keyopts.desc = "Previous Buffer"
keymap.set("n", "<S-h>", ":bprevious<CR>", keyopts)

-- split window vertically
keyopts.desc = "vertical split"
keymap.set("n", "<leader>wv", ":vsplit<CR>", keyopts)

-- split window horizontally
keyopts.desc = "horizontally split"
keymap.set("n", "<leader>ws", ":split<CR>", keyopts)

-- close window
keyopts.desc = "close window"
keymap.set("n", "<leader>wc", ":close<CR>", keyopts)

-- Better window navigation
keyopts.desc = "Windows Navigation"
keymap.set("n", "<C-h>", "<C-w>h", keyopts)
keymap.set("n", "<C-j>", "<C-w>j", keyopts)
keymap.set("n", "<C-k>", "<C-w>k", keyopts)
keymap.set("n", "<C-l>", "<C-w>l", keyopts)

