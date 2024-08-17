return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	event = "BufReadPost",
	dependencies = { "nvim-treesitter/nvim-treesitter" },

	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahed = true,

					keymaps = {
						["af"] = { query = "@function.outer", desc = "outer function" },
						["if"] = { query = "@function.inner", desc = "inner function" },

						["aF"] = { query = "@call.outer", desc = "outer function call" },
						["iF"] = { query = "@call.inner", desc = "inner function call" },

						["ac"] = { query = "@class.outer", desc = "outer class" },
						["ic"] = { query = "@class.inner", desc = "inner class" },

						["ai"] = { query = "@conditional.outer", desc = "outer conditional" },
						["ii"] = { query = "@conditional.inner", desc = "inner conditional" },

						["al"] = { query = "@loop.outer", desc = "outer loop" },
						["il"] = { query = "@loop.inner", desc = "inner loop" },

						["ar"] = { query = "@return.outer", desc = "outer return statement" },
						["ir"] = { query = "@return.inner", desc = "inner return statement" },
					},
				},

				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]a"] = { query = "@assignment.outer", desc = "assignment" },
						["]f"] = { query = "@function.outer", desc = "function" },
						["]F"] = { query = "@call.outer", desc = "function call" },
						["]c"] = { query = "@class.outer", desc = "class" },
						["]i"] = { query = "@conditional.outer", desc = "conditional" },
						["]l"] = { query = "@loop.outer", desc = "loop" },
						["]r"] = { query = "@return.outer", desc = "return" },
					},
					goto_previous_start = {
						["[a"] = { query = "@assignment.outer", desc = "assignment" },
						["[f"] = { query = "@function.outer", desc = "function" },
						["[F"] = { query = "@call.outer", desc = "function call" },
						["[c"] = { query = "@class.outer", desc = "class" },
						["[i"] = { query = "@conditional.outer", desc = "conditional" },
						["[l"] = { query = "@loop.outer", desc = "loop" },
						["[r"] = { query = "@return.outer", desc = "return" },
					},
				},
			},
		})
	end,
}
