local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
vim.keymap.set('n', '<leader>m', builtin.marks, {})

vim.keymap.set('n', '<leader>g', function()
    builtin.grep_string({ search = vim.fn.input("Telescope grep: ") })
end)
vim.keymap.set('n', 'gw', function()
    builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)
vim.keymap.set('n', 'gW', function()
    builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
end)
vim.keymap.set('v', 'gw', '"hy:Telescope grep_string default_text=<C-r>h<CR>')

local telescope = require('telescope')

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        mappings = {
            i = {
                ['<c-q>'] = actions.send_selected_to_qflist,
            },
        },
        prompt_prefix = '🔎 '
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        marks = {
            theme = "dropdown",
        },
        buffers = {
            theme = "dropdown",
        }
    },
})

telescope.load_extension('fzf')
