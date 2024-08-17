return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	opts = {
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		indent = { enable = true },
		ensure_installed = {
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"tsx",
			"typescript",
			"vim",
			"yaml",
			"sql",
			"php",
			"tmux",
			"vim",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<C-S-space>",
			},
		},
	},

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
