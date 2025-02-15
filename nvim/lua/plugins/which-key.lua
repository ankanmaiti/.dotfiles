return {
	{
		"folke/which-key.nvim",
    cond = not is_vscode,
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300

			local wk = require("which-key")

			wk.setup({
				icons = {
					mappings = false,
				},
				plugins = {
					marks = false, -- shows a list of your marks on ' and `
					registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
					-- the presets plugin, adds help for a bunch of default keybindings in Neovim
					-- No actual key bindings are created
					spelling = {
						enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
						suggestions = 20, -- how many suggestions should be shown in the list?
					},
					presets = {
						operators = false, -- adds help for operators like d, y, ...
						motions = false, -- adds help for motions
						text_objects = false, -- help for text objects triggered after entering an operator
						windows = false, -- default bindings on <c-w>
						nav = false, -- misc bindings to work with windows
						z = false, -- bindings for folds, spelling and others prefixed with z
						g = false, -- bindings for prefixed with g
					},
				},
			})

			wk.add({
				{ "<leader>f", group = "Find" },
				{ "<leader>c", group = "Code" },
				{ "<leader>w", group = "windows" },
				{ "<leader>h", group = "harpoon" },
				{ "<leader>g", group = "git" },
			}, {
				mode = { "n", "v" },
			})
		end,
	},
}
