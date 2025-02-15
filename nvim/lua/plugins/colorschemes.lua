return {
  {
		"catppuccin/nvim",
    cond = not is_vscode,
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
        term_colors = true,
        transparent_background = true,
				custom_highlights = function(colors)
					return { netrwTreeBar = { fg = colors.surface0 } }
				end,
			})

			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme tokyonight-moon]])
	-- 	end,
	-- },
}
