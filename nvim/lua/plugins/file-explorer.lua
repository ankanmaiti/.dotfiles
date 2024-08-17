return {
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"MunifTanjim/nui.nvim",
	-- 		--"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	-- 	},
	-- 	opts = {
	-- 		event_handlers = {
	-- 			{
	-- 				event = "neo_tree_buffer_enter",
	-- 				handler = function()
	-- 					vim.cmd([[
	--              setlocal relativenumber
	--            ]])
	-- 				end,
	-- 			},
	-- 		},
	-- 	},
	-- 	init = function()
	-- 		--setup keymap
	-- 		local keymap = vim.keymap -- for concisness
	-- 		local keyopts = { noremap = true, silent = true }
	--
	-- 		keyopts.desc = "File Explorer"
	-- 		keymap.set("n", "<leader>e", ":Neotree toggle<cr>", keyopts)
	-- 	end,
	-- },
	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "echasnovski/mini.icons" },
		},
		config = function()
			require("oil").setup({
				default_file_explorer = true,

				-- Send deleted files to the trash
				-- instead of permanently deleting them
				delete_to_trash = true,

				-- Skip the confirmation popup for simple operations
				skip_confirm_for_simple_edits = true,

				-- keybindings
				keymaps = {
					["<esc>"] = "actions.close",
				},
				-- Set to false to disable all of the above keymaps
				use_default_keymaps = true,

				view_options = {
					-- Show files and directories that start with "."
					show_hidden = true,

					-- Sort file names in a more intuitive order for humans.
					-- less performant, set false for large directories.
					natural_order = true,

					-- This function defines what will never be shown,
					-- even when `show_hidden` is set
					is_always_hidden = function(name, _)
						return name == ".." or name == ".git"
					end,
				},

				float = {
					-- preview_split:
					-- Split direction: "auto", "left", "right", "above", "below".
					preview_split = "right",
				},
			})

			--setup keymap
			local keymap = vim.keymap -- for concisness
			local keyopts = { noremap = true, silent = true }

			keyopts.desc = "Open parent directory"
			keymap.set("n", "-", ":Oil --float<cr>", keyopts)
		end,
	},
}
