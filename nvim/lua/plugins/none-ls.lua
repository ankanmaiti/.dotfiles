return {
	"nvimtools/none-ls.nvim",
	event = "BufReadPost",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- formatter
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.blade_formatter,
				null_ls.builtins.formatting.pint,

				-- diagnostics
				require("none-ls.diagnostics.eslint_d"), -- requires none-ls-extras.nvim
				null_ls.builtins.diagnostics.phpstan,
			},
		})
		-- set keymap
		local keymap = vim.keymap -- for concisness
		local keyopts = { noremap = true, silent = true }

		keyopts.desc = "Format Code"
		keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, keyopts)
	end,
}
