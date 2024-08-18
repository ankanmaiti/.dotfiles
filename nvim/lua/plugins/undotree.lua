return {
	"mbbill/undotree",
	event = "BufReadPost",
	config = function()
		local keymap = vim.keymap -- for concisness
		local opts = { noremap = true, silent = true }

		opts.desc = "Undo Tree"
		keymap.set("n", "<leader>cu", ":UndotreeToggle<cr>", opts)
	end,
}
