-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim', 'nvim-telescope/telescope-media-files.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'tpope/vim-commentary',
    { 'airblade/vim-gitgutter', branch = 'main' },
    'kylechui/nvim-surround',
    'windwp/nvim-autopairs',
    'RRethy/nvim-treesitter-endwise',
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    },
    { 'nvim-lualine/lualine.nvim' },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    { "folke/neodev.nvim", opts = {} },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      dependencies = "nvim-treesitter/nvim-treesitter",
      after = "nvim-treesitter",
    },
    { 'chentoast/marks.nvim' },
    -- {
    --   "zbirenbaum/copilot.lua",
    --   cmd = "Copilot",
    --   event = "InsertEnter",
    --   config = function()
    --     require("copilot").setup({
    --         suggestion = {
    --             auto_trigger = true
    --         },
    --         filetypes = {
    --             yaml = true
    --         }
    --     })
    --   end,
    -- },
    -- {
    --   "supermaven-inc/supermaven-nvim",
    --   config = function()
    --       require("supermaven-nvim").setup({
    --           enable = true,
    --           keymaps = {
    --               accept_suggestion = "<M-l>",
    --               clear_suggestion = "<C-]>",
    --               accept_word = "<C-j>",
    --           },
    --       })
    --   end,
    -- },
    {
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {}
        end,
        init = function()
            vim.cmd("colorscheme poimandres")
        end
    }
})
