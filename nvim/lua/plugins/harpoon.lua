return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		-- setup keymaps
		local keymap = vim.keymap -- for concisness
		local opts = { noremap = true, silent = true }

		opts.desc = "harpoon list"
		keymap.set("n", "<leader>hl", function()
			toggle_telescope(harpoon:list())
		end, opts)

		opts.desc = "add mark"
		keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, opts)

		-- Toggle previous & next buffers stored within Harpoon list
		opts.desc = "prev mark"
		keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, opts)

		opts.desc = "next mark"
		keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, opts)

		opts.desc = "harpoon menu"
		keymap.set("n", "<leader><leader>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, opts)
	end,
}
