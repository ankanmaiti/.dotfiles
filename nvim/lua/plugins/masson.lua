-- Mason allows to easily manage editor tooling
-- such as LSP servers, DAP servers, linters, and formatters.
--
-- Mason is like a frontend
--
return {
	{
		"williamboman/mason.nvim",
    cond = not is_vscode,

		config = function()
			local mason = require("mason")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	-- bridge between mason and lspconfig
	-- automatic install LSP servers
	{
		"williamboman/mason-lspconfig.nvim",
    cond = not is_vscode,

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"html",
					"cssls",
					"tailwindcss",
					"lua_ls",
					"phpactor",
				},

				-- auto-install configured servers (with lspconfig)
				automatic_installation = true, -- not the same as ensure_installed
			})
		end,
	},
	-- automatic install language tool (formatter, linter, etc)
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
    cond = not is_vscode,

		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd", -- formatter
					"stylua", -- formatter
					"eslint_d", -- js linter
					"phpstan", -- php linter
					"pint", -- laravel formatter
				},
			})
		end,
	},
}
