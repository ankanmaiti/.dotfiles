return {
	-- git signes
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",

		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup()

			-- setup keymaps
			-- local opts = { noremap = true, silent = true }
			--
			-- opts.desc = "preview hunk"
			-- vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, opts)
			--
			-- opts.desc = "line blame"
			-- vim.keymap.set("n", "<leader>gl", gitsigns.toggle_current_line_blame, opts)
		end,
	},
}
