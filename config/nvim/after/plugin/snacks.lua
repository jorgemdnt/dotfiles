local Snacks = require('snacks')

-- File pickers
vim.keymap.set('n', '<leader>f', function() Snacks.picker.files() end, {})
vim.keymap.set('n', '<leader><space>', function() Snacks.picker.buffers() end, {})
vim.keymap.set('n', ';', function() Snacks.picker.buffers() end, {})

-- Mark picker
vim.keymap.set('n', '<leader>m', function() Snacks.picker.marks() end, {})

-- Git status
vim.keymap.set('n', '<leader>d', function() Snacks.picker.git_status() end, {})

-- Grep with input
vim.keymap.set('n', '<leader>g', function()
    Snacks.picker.grep()
end, {})

-- Grep word under cursor (normal mode)
vim.keymap.set('n', 'gw', function()
    Snacks.picker.grep_word()
end, {})

-- Grep WORD under cursor (normal mode)
vim.keymap.set('n', 'gW', function()
    local word = vim.fn.expand("<cWORD>")
    Snacks.picker.grep({ search = word })
end, {})

-- Grep selection (visual mode)
vim.keymap.set('v', 'gw', function()
    Snacks.picker.grep_word()
end, {})

-- Open file picker on VimEnter if no file is specified
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argv(0) == "" then
            Snacks.picker.files()
        end
    end,
})
