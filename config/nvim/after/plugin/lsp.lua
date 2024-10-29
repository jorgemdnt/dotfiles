local lsp = require("lsp-zero")

require('mason').setup({
    PATH = "append"
})
require('mason-lspconfig').setup({
    ensure_installed = {'ts_ls', 'eslint', 'solargraph', 'terraformls', 'tflint', 'lua_ls'},
    handlers = {lsp.default_setup},
})

require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({})
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_action = require('lsp-zero').cmp_action()

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

cmp.setup({
    formatting = cmp_format,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'buffer'},
    },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
})

lsp.on_attach(function(_, bufnr)
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
