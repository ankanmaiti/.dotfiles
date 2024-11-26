return {
	{
		"ggandor/leap.nvim",
		enabled = true,
		config = function(_, opts)
			local leap = require("leap")

			local keymap = vim.keymap -- for concisness
			local keyopts = { noremap = true, silent = true }

			keyopts.desc = "Leap Forward"
			keymap.set({ "n", "x", "o" }, "gf", "<Plug>(leap-forward)", keyopts)

			keyopts.desc = "Leap Backward"
			keymap.set({ "n", "x", "o" }, "gF", "<Plug>(leap-backward)", keyopts)

			keyopts.desc = "Leap From Window"
			keymap.set({ "n", "x", "o" }, "gw", "<Plug>(leap-from-window)", keyopts)
		end,
	},
}
