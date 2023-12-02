local lsp = require("lsp-zero")

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'tsserver', 'eslint', 'solargraph'},
    handlers = {
        lsp.default_setup,
    },
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    })
})

lsp.on_attach(function(client, bufnr)
    -- K: Displays hover information about the symbol under the cursor in a floating window
    -- gd: Jumps to the definition of the symbol under the cursor
    -- gD: Jumps to the declaration of the symbol under the cursor
    -- gi: Lists all the implementations for the symbol under the cursor in the quickfix window
    -- go: Jumps to the definition of the type of the symbol under the cursor
    -- gr: Lists all the references to the symbol under the cursor in the quickfix window
    -- gs: Displays signature information about the symbol under the cursor in a floating window
    -- <F2>: Renames all references to the symbol under the cursor
    -- <F3>: Format code in current buffer
    -- <F4>: Selects a code action available at the current cursor position
    -- gl: Show diagnostics in a floating window
    -- [d: Move to the previous diagnostic in the current buffer
    -- ]d: Move to the next diagnostic
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()
