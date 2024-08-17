return {
	"christoomey/vim-tmux-navigator",
  event = "VeryLazy",

	config = function()
		local keymap = vim.keymap -- for concisness
		local keyopts = { noremap = true, silent = true }

    keyopts.desc = "tmux navigation"
		keymap.set("n", "<c-h>", ":TmuxNavigateLeft<CR>", keyopts)
		keymap.set("n", "<c-j>", ":TmuxNavigateDown<CR>", keyopts)
		keymap.set("n", "<c-k>", ":TmuxNavigateUp<CR>", keyopts)
		keymap.set("n", "<c-l>", ":TmuxNavigateRight<CR>", keyopts)
	end,
}

