-- setup leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrap lazy.nvim and plugins
require("config.core")
require("config.lazy")
require("config.keymaps")
