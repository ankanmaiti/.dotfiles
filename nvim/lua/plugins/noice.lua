return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- "MunifTanjim/nui.nvim",
		-- "rcarriga/nvim-notify",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				messages = {
					enabled = true,
				},
			},
			lsp = {
				progress = {
					enabled = false,
				},
				-- override markdown rendering
				-- so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				-- bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		})

		-- keybindings
		local keymap = vim.keymap -- for concisness
		local keyopts = { noremap = true, silent = true }

		keyopts.desc = "Noice Dismiss" -- Find Noice
		keymap.set("n", "<esc>", ":Noice dismiss<cr>", keyopts)

		keyopts.desc = "Noice" -- Find Noice
		keymap.set("n", "<leader>fn", ":Telescope noice theme=dropdown<cr>", keyopts)
	end,
}
