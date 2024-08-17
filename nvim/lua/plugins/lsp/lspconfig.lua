-- LSP: language server protocall
-- is a open json-rpc standard that communicate between code-editor & language-servers
-- which provide language intelegence feature.
--
-- LSP is like a backend for code related stuff
--
return {
	"neovim/nvim-lspconfig",
	event = "BufReadPost",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local keymap = vim.keymap
		local keyopts = { noremap = true, silent = true }

		local on_attach = function(_, bufnr)
			keyopts.buffer = bufnr

			-- set keybinds
			-- Go to
			keyopts.desc = "Go to definitions"
			keymap.set("n", "gd", ":Telescope lsp_definitions<cr>", keyopts)

			keyopts.desc = "Show LSP implementations"
			keymap.set("n", "gi", ":Telescope lsp_implementations<cr>", keyopts)

			keyopts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", ":Telescope lsp_type_definitions<cr>", keyopts)

			keyopts.desc = "See Code Actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, keyopts)

			-- lsp incoming calls
			keyopts.desc = "Where the function invoked under the cursor"
			keymap.set({ "n", "v" }, "<leader>ci", ":Telescope lsp_incoming_calls<cr>", keyopts)

			-- lsp outgoing calls
			keyopts.desc = "Where the function calls other functions"
			keymap.set({ "n", "v" }, "<leader>co", ":Telescope lsp_outgoing_calls<cr>", keyopts)

			-- Rename
			keyopts.desc = "Smart Rename"
			keymap.set({ "n", "v" }, "<leader>cr", vim.lsp.buf.rename, keyopts)

			-- Diagnostics
			keyopts.desc = "Document Diagnostics" -- Find Diagnostics (current buffer)
			keymap.set("n", "<leader>cd", ":Telescope diagnostics bufnr=0<cr>", keyopts)

			keyopts.desc = "Diagnostics" -- Find Diagnostics (CWD)
			keymap.set("n", "<leader>fd", ":Telescope diagnostics<cr>", keyopts)

			keyopts.desc = "Show Line Diagnostics" -- Under Cursor
			keymap.set("n", "<leader>cl", vim.diagnostic.open_float, keyopts)

			-- inlay hints
			keyopts.desc = "Inlay Hints (toggle)"
			keymap.set("n", "<leader>ch", function()
				local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
				vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = bufnr })
			end, keyopts)
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		--change the diagnostic symbols in the sign column (gutter)
		local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- support for inlayhints
		local inlayHints = {
			includeInlayEnumMemberValueHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayVariableTypeHints = false,
		}

		-- configure tsserver server
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				javascript = {
					inlayHints = inlayHints,
				},
				typescript = {
					inlayHints = inlayHints,
				},
			},
			commands = {

				-- organize imports
				OrganizeImports = {
					function()
						local params = {
							command = "_typescript.organizeImports",
							arguments = { vim.api.nvim_buf_get_name(0) },
							title = "",
						}
						vim.lsp.buf.execute_command(params)
					end,
					description = "Organize Imports",
				},
			},
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"html",
				"javascriptreact",
				"typescriptreact",
			},
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure emmet server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css" },
		})

		lspconfig["phpactor"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "php" },
			root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
			init_options = {
				["language_server_phpstan.enabled"] = true,
				["language_server_psalm.enabled"] = false,
			},
			settings = {
				php = {
					inlayHints = inlayHints,
				},
			},
		})

		-- configure lua server
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					inlayHints = inlayHints,
					-- make language server recognize "vim" global
					diagnostics = { global = { "vim" } },
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
