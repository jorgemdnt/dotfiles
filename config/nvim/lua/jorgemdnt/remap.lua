vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>x", vim.cmd.x)
vim.keymap.set("n", "<leader>q", vim.cmd.q)

-- vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<bs>", "<c-^>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("x", "p", "\"_dP")
-- vim.keymap.set("n", "<leader>d", "\"_d")
-- vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>S", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/cI<Left><Left><Left>")
vim.keymap.set("n", "<leader>s", ":,$s/\\<<C-r><C-w>\\>/<C-r><C-w>/cI<Left><Left><Left>")
vim.keymap.set("v", "S", ":s/")
vim.keymap.set("v", "s", '"hy:%s/<C-r>h//Ic<left><left><left>')

vim.keymap.set("v", "<", '<gv')
vim.keymap.set("v", ">", '>gv')

vim.api.nvim_create_user_command(
    'Term',
    'belowright split term://<args>',
    { nargs = 1, complete = 'shellcmd', range = true }
)

vim.api.nvim_create_user_command(
    'Zsh',
    'belowright split term://zsh',
    { nargs = 0 }
)


local terminal_buf = nil
local terminal_open = false

function ToggleTerminal()
  if terminal_open then
    vim.cmd("hide")
    terminal_open = false
  else
    if terminal_buf == nil or not vim.api.nvim_buf_is_valid(terminal_buf) then
      vim.cmd("Zsh")
      terminal_buf = vim.api.nvim_get_current_buf()
    else
      vim.cmd("botright split")
      vim.cmd("buffer " .. terminal_buf)
    end
    terminal_open = true
    vim.cmd("startinsert")
  end
end

vim.keymap.set("n", "<leader>z", ToggleTerminal, { noremap = true, silent = true })

vim.keymap.set("t", "<esc>", ToggleTerminal)

vim.keymap.set("n", "<leader>n", vim.cmd.nohlsearch)

vim.api.nvim_create_user_command(
    'CopyFileName',
    'let @+ = expand("%:t")',
    {}
)

vim.api.nvim_create_user_command(
    'CopyFilePath',
    'let @+ = expand("%:p")',
    {}
)

vim.api.nvim_create_user_command(
    'CopyRelativeFilePath',
    'let @+ = expand("%:.")',
    {}
)

vim.api.nvim_create_user_command(
    'FindAndReplace',
    function (opts)
        local find = opts.fargs[1]
        local replace = opts.fargs[2]
        vim.cmd('grep! ' .. find)
        vim.cmd('cdo s/' .. find .. '/' .. replace .. '/c | update')
    end,
    { nargs = '*' }
)
