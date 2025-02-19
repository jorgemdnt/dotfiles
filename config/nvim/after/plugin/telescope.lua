local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
vim.keymap.set('n', '<leader>m', function()
   builtin.marks({mark_type = "all"})
end)

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
vim.keymap.set('n', ';', function()
    builtin.buffers()
end)

local telescope = require('telescope')

telescope.setup({
    defaults = {
        layout_config = {
            width = 0.99,         -- Almost full width
            height = 0.99,        -- Almost full height
        },
        file_ignore_patterns = { "node_modules", ".git/" },
        mappings = {
            i = {
                ['<c-q>'] = actions.send_selected_to_qflist,
            },
        },
        prompt_prefix = '🔎 ',
        vimgrep_arguments = {
            'rg',
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            '--hidden',
            '--vimgrep',
        },
    },
    pickers = {
        find_files = {
            find_command = {'fd', '--hidden', '--follow', '--exclude', '.git', '--type', 'f'},
        },
        grep_string = {
            find_command = {'rg', '--hidden', '--vimgrep'},
        },
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

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      builtin.find_files()
    end
  end,
})
