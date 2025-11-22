-- ## Mason & Mason-LSPConfig Setup ## --
require('mason').setup({
    PATH = "append"
})

require('mason-lspconfig').setup({
    ensure_installed = { 'ts_ls', 'eslint', 'biome', 'solargraph', 'terraformls', 'tflint', 'lua_ls' },
})

-- Load LuaSnip snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- ## Native Neovim LSP Configuration ## --
local lspconfig = require('lspconfig')


-- Get blink.cmp capabilities for LSP servers
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Helper function to set up keymaps for LSP buffers
local on_attach = function(client, bufnr)
    -- Helper function for keymaps
    local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, noremap = true, silent = true })
    end

    -- K: Displays hover information about the symbol under the cursor in a floating window
    map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')

    -- gd: Jumps to the definition of the symbol under the cursor
    map('n', 'gd', vim.lsp.buf.definition, 'Goto Definition')

    -- gD: Jumps to the declaration of the symbol under the cursor
    map('n', 'gD', vim.lsp.buf.declaration, 'Goto Declaration')

    -- gi: Lists all the implementations for the symbol under the cursor in the quickfix window
    map('n', 'gi', vim.lsp.buf.implementation, 'Goto Implementation')

    -- go: Jumps to the definition of the type of the symbol under the cursor
    map('n', 'go', vim.lsp.buf.type_definition, 'Goto Type Definition')

    -- gr: Lists all the references to the symbol under the cursor in the quickfix window
    map('n', 'gr', vim.lsp.buf.references, 'Goto References')

    -- gs: Displays signature information about the symbol under the cursor in a floating window
    map('n', 'gs', vim.lsp.buf.signature_help, 'Signature Help')

    -- <F2>: Renames all references to the symbol under the cursor
    map('n', '<F2>', vim.lsp.buf.rename, 'Rename')

    -- <F3>: Format code in current buffer
    map('n', '<F3>', function()
        vim.lsp.buf.format({ async = true })
    end, 'Format Document')

    -- <F4>: Selects a code action available at the current cursor position
    map('n', '<F4>', vim.lsp.buf.code_action, 'Code Action')

    -- gl: Show diagnostics in a floating window
    map('n', 'gl', vim.diagnostic.open_float, 'Show Line Diagnostics')

    -- [d: Move to the previous diagnostic in the current buffer
    map('n', '[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')

    -- ]d: Move to the next diagnostic
    map('n', ']d', vim.diagnostic.goto_next, 'Next Diagnostic')

    -- Formatting group (currently commented out, can be enabled if needed)
    -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    -- if client and client.supports_method("textDocument/formatting") and client.name ~= "ts_ls" then
    --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --     vim.api.nvim_create_autocmd("BufWritePre", {
    --         group = augroup,
    --         buffer = bufnr,
    --         callback = function()
    --             vim.lsp.buf.format()
    --         end,
    --     })
    -- end

    -- ESLint specific formatting (currently commented out, can be enabled if needed)
    -- if (client.name == "eslint") then
    --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --     vim.api.nvim_create_autocmd("BufWritePre", {
    --         buffer = bufnr,
    --         group = augroup,
    --         callback = function()
    --             vim.cmd("EslintFixAll")
    --         end,
    --     })
    -- end
end

-- Configure LSP servers
local servers = {
    'ts_ls',
    'eslint',
    'biome',
    'solargraph',
    'terraformls',
    'tflint',
    'lua_ls',
}

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end
