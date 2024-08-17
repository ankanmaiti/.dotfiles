-- Mason allows to easily manage editor tooling
-- such as LSP servers, DAP servers, linters, and formatters.
--
-- Mason is like a frontend
--
return {
	{
		"williamboman/mason.nvim",

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

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"lua_ls",
					"emmet_ls",
          "sqlls",
          "phpactor",
          "stimulus_ls",
				},

				-- auto-install configured servers (with lspconfig)
				automatic_installation = true, -- not the same as ensure_installed
			})
		end,
	},
	-- automatic install language tool (formatter, linter, etc)
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd", -- formatter
					"stylua", -- formatter
					"eslint_d", -- js linter
          "blade-formatter", -- formatter
          "phpstan", -- php linter
          "pint", -- laravel formatter
				},
			})
		end,
	},
}
