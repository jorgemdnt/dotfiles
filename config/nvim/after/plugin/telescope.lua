local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set("n", "<leader><space>", builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fc', builtin.command_history, {})
vim.keymap.set('n', '<leader>m', builtin.marks, {})
vim.keymap.set('n', '<leader>r', builtin.lsp_references, {})

vim.keymap.set('n', '<leader>g', function()
       builtin.grep_string({ search = vim.fn.input("Grep: ") })
end)

local telescope = require('telescope')

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
    mappings = {
      i = {
        ['<c-q>'] = actions.send_selected_to_qflist,
      },
    },
  }
})

telescope.load_extension('fzf')
