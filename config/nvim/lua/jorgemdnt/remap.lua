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

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("v", "<leader>s", '"hy:%s/<C-r>h//gc<left><left><left>')

vim.api.nvim_create_user_command(
    'TermCommand',
    'belowright split term://<args>',
    { nargs = 1, complete = 'shellcmd', range = true }
)

vim.api.nvim_create_user_command(
    'Zsh',
    'belowright split term://zsh',
    { nargs = 0 }
)
vim.keymap.set("n", "<leader>z", ":Zsh<cr>")
vim.keymap.set("v", "<leader>z", "y:Zsh<cr>")

vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

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
