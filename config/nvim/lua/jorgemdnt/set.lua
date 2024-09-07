vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 1
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.gdefault = true

vim.o.laststatus=3

vim.opt.clipboard = "unnamedplus"

vim.opt.ignorecase = true
vim.opt.infercase = true

vim.opt.grepprg = "rg --hidden --vimgrep $*"
vim.g.fzf_default_command = 'rg --files --hidden --follow'
vim.opt.grepformat = "%f:%l:%c:%m"

local openQuickFixGroup = vim.api.nvim_create_augroup("OpenQuickfixAfterGrep", { clear = true })
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "[^l]*",
    command = "copen",
    group = openQuickFixGroup,
})
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "l*",
    command = "lopen",
    group = openQuickFixGroup,
})

local termOpenGroup = vim.api.nvim_create_augroup("TermOpenGroup", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert",
    group = termOpenGroup,
})

vim.opt.rtp:append("/opt/homebrew/opt/fzf")
