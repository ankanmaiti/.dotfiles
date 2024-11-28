local keymap = vim.keymap -- for concisness
local keyopts = { noremap = true, silent = true }

if not is_vscode then
    -- Navigate buffers
    keyopts.desc = "Next Buffer"
    keymap.set("n", "<S-l>", ":bnext<CR>", keyopts)

    keyopts.desc = "Previous Buffer"
    keymap.set("n", "<S-h>", ":bprevious<CR>", keyopts)

    -- split window vertically
    keyopts.desc = "vertical split"
    keymap.set("n", "<leader>wv", ":vsplit<CR>", keyopts)

    -- split window horizontally
    keyopts.desc = "horizontally split"
    keymap.set("n", "<leader>ws", ":split<CR>", keyopts)

    -- close window
    keyopts.desc = "close window"
    keymap.set("n", "<leader>wc", ":close<CR>", keyopts)

    -- Better window navigation
    keyopts.desc = "Windows Navigation"
    keymap.set("n", "<C-h>", "<C-w>h", keyopts)
    keymap.set("n", "<C-j>", "<C-w>j", keyopts)
    keymap.set("n", "<C-k>", "<C-w>k", keyopts)
    keymap.set("n", "<C-l>", "<C-w>l", keyopts)
end
--
--
--
--
--
-- below : code related Keymaps, only for vscode
-- for neovim, written in lspconfig.lua using Telescope plugin
--
--
--
--
--
if is_vscode then
    -- keyopts.desc = "Go to definitions"
    -- keymap.set("n", "gd", vim.lsp.buf.definition, keyopts)

    keyopts.desc = "Show LSP implementations"
    keymap.set("n", "gi", vim.lsp.buf.implementation, keyopts)

    keyopts.desc = "Show LSP type definitions"
    keymap.set("n", "gt", vim.lsp.buf.type_definition, keyopts)

    keyopts.desc = "Go to references"
    keymap.set("n", "gr", vim.lsp.buf.references, keyopts)

    keyopts.desc = "Go to Symbols"
    keymap.set("n", "gs", vim.lsp.buf.document_symbol, keyopts)

    keyopts.desc = "Go to Workbench Symbols"
    keymap.set("n", "gS", vim.lsp.buf.workspace_symbol, keyopts)

    keyopts.desc = "See Code Actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, keyopts)

    -- Rename
    keyopts.desc = "Smart Rename"
    keymap.set({ "n", "v" }, "<leader>cr", vim.lsp.buf.rename, keyopts)

    -- lsp incoming calls
    keyopts.desc = "Where the function invoked under the cursor"
    keymap.set({ "n", "v" }, "<leader>ci", vim.lsp.buf.incoming_calls, keyopts)

    -- lsp outgoing calls
    keyopts.desc = "Where the function calls other functions"
    keymap.set({ "n", "v" }, "<leader>co", vim.lsp.buf.outgoing_calls, keyopts)

    -- Format Code
    keyopts.desc = "Format Code"
    keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, keyopts)

    -- Toggle inlay hints for the current buffer
    keyopts.desc = "Inlay Hints (toggle)"
    vim.keymap.set("n", "<leader>ch", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
    end, keyopts)
end
