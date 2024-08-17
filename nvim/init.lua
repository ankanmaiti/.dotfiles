-- setup leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrap lazy.nvim and plugins
require("config.core")
require("config.keymaps")
require("config.lazy")
