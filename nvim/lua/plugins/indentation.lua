return {
	{
		"echasnovski/mini.indentscope",
    cond = not is_vscode,
		version = "*", -- wait till new 0.7.0 release to put it back on semver
		event = "BufReadPost",
		opts = {
			symbol = "▏",
			-- symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
    cond = not is_vscode,
		event = "BufReadPost",
		opts = {
			indent = {
				char = "▏",
				tab_char = "▏",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		main = "ibl",
	},
}
