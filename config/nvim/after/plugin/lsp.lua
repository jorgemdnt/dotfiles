-- ## Mason Setup (Package Manager Only) ## --
require('mason').setup({
    PATH = "append"
})

-- Load LuaSnip snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- ## Native Neovim 0.11+ LSP Configuration ## --
-- Get blink.cmp capabilities for LSP servers
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Set up LSP keymaps when a buffer attaches to an LSP server
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

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
    end,
})

-- Configure language servers using native vim.lsp.config
local lsps = {
    {
        'ts_ls',
        {
            cmd = { 'typescript-language-server', '--stdio' },
            filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
            root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
            capabilities = capabilities,
        }
    },
    {
        'biome',
        {
            cmd = { 'biome', 'lsp-proxy' },
            filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', 'jsonc' },
            root_markers = { 'biome.json', 'biome.jsonc', '.git' },
            capabilities = capabilities,
        }
    },
    {
        'solargraph',
        {
            cmd = { 'solargraph', 'stdio' },
            filetypes = { 'ruby' },
            root_markers = { 'Gemfile', '.git' },
            capabilities = capabilities,
        }
    },
    {
        'terraformls',
        {
            cmd = { 'terraform-ls', 'serve' },
            filetypes = { 'terraform', 'tf' },
            root_markers = { '.terraform', '.git' },
            capabilities = capabilities,
        }
    },
    {
        'tflint',
        {
            cmd = { 'tflint', '--langserver' },
            filetypes = { 'terraform' },
            root_markers = { '.tflint.hcl', '.git' },
            capabilities = capabilities,
        }
    },
    {
        'lua_ls',
        {
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
            root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', '.git' },
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    diagnostics = { globals = { 'vim' } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
        }
    },
    {
        'tailwindcss',
        {
            cmd = { 'tailwindcss-language-server', '--stdio' },
            filetypes = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
            root_markers = { 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts', 'postcss.config.js', '.git' },
            capabilities = capabilities,
        }
    },
}

for _, lsp in pairs(lsps) do
    local name, config = lsp[1], lsp[2]
    vim.lsp.enable(name)
    if config then
        vim.lsp.config(name, config)
    end
end
