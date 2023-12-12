require("rest-nvim").setup({})

vim.keymap.set('n', '<leader>rc', "<Plug>RestNvim", {})
vim.keymap.set('n', '<leader>rr', "<Plug>RestNvimLast", {})
vim.keymap.set('n', '<leader>rp', "<Plug>RestNvimLast", {})
