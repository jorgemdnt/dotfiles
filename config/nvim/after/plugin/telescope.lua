local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
vim.keymap.set('n', '<leader>m', builtin.marks, {})

vim.keymap.set('n', '<leader>d', function()
    builtin.git_status()
end)
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
            find_command = {'rg', '--hidden', '--files', '--no-ignore-vcs', '--follow'},
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
telescope.load_extension('media_files')

local pickers = require('telescope.pickers')
local finders = require('telescope.finders')

local git_status_picker = function()
  local opts = {}

  pickers.new(opts, {
    prompt_title = 'Git Status',
    finder = finders.new_oneshot_job({'git', 'status', '--short'}, opts),
  }):find()
end

telescope.register_extension({
  exports = {
    git_status = git_status_picker,
  },
})
