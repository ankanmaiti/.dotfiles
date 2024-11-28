vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

-- Use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- setup copy color
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='Search', timeout=100})
  augroup END
]])

-- Check if Neovim is running in VSCode
is_vscode = vim.g.vscode or false

if is_vscode then
	vim.notify = require'vscode'.notify
  print('from neovim to vscode: Hi vscode :)')
end
