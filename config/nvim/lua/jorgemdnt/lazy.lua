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
    { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },
    'mbbill/undotree',
    'tpope/vim-commentary',
    'kylechui/nvim-surround',
    'windwp/nvim-autopairs',
    'RRethy/nvim-treesitter-endwise',
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            vim.keymap.set("n", "<leader>t", ":Neotree reveal toggle<CR>")
        end,
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
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta",     lazy = true }, -- optional `vim.uv` typings
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       -- add a border to hover docs and signature help
                },
            })
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        init = function()
            vim.cmd("colorscheme catppuccin-frappe")
        end
    },
    'tpope/vim-fugitive',
    { 'airblade/vim-gitgutter', branch = 'main' },
    -- {
    --     "yetone/avante.nvim",
    --     event = "VeryLazy",
    --     version = false, -- Never set this value to "*"! Never!
    --     opts = {
    --         -- add any opts here
    --         -- for example
    --         provider = "groq",
    --         openai = {
    --             endpoint = "https://api.openai.com/v1",
    --             api_key_name = "OPENAI_API_KEY",
    --             model = "gpt-4o",  -- your desired model (or use gpt-4o, etc.)
    --             timeout = 30000,   -- Timeout in milliseconds, increase this for reasoning models
    --             temperature = 0,
    --             max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
    --             --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    --         },
    --         behaviour = {
    --             auto_suggestions = false, -- Experimental stage
    --             auto_set_highlight_group = true,
    --             auto_set_keymaps = true,
    --             auto_apply_diff_after_generation = false,
    --             support_paste_from_clipboard = false,
    --             minimize_diff = true,                        -- Whether to remove unchanged lines when applying a code block
    --             enable_token_counting = true,                -- Whether to enable token counting. Default to true.
    --             enable_cursor_planning_mode = true,          -- Whether to enable Cursor Planning Mode. Default to false.
    --             enable_claude_text_editor_tool_mode = false, -- Whether to enable Claude Text Editor Tool Mode.
    --         },
    --         --
    --         -- provider = "together",
    --         vendors = {
    --             together = {
    --                 __inherited_from = 'openai',
    --                 endpoint = "https://api.together.xyz/v1",
    --                 api_key_name = "TOGETHER_API_KEY",
    --                 model = "deepseek-ai/DeepSeek-V3", -- your desired model (or use gpt-4o, etc.)
    --                 timeout = 30000,                   -- Timeout in milliseconds, increase this for reasoning models
    --                 max_tokens = 20000,                -- Increase this to include reasoning tokens (for reasoning models)
    --                 -- reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    --             },
    --             google = {
    --                 __inherited_from = 'openai',
    --                 endpoint = "https://generativelanguage.googleapis.com/v1beta/openai/",
    --                 api_key_name = "GEMINI_API_KEY",
    --                 model = "gemini-2.5-pro-exp-03-25", -- your desired model (or use gpt-4o, etc.)
    --                 timeout = 30000,                    -- Timeout in milliseconds, increase this for reasoning models
    --                 max_tokens = 8192,                  -- Increase this to include reasoning tokens (for reasoning models)
    --                 -- reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    --             },
    --             --- ... existing vendors
    --             groq = { -- define groq provider
    --                 __inherited_from = 'openai',
    --                 api_key_name = 'GROQ_API_KEY',
    --                 endpoint = 'https://api.groq.com/openai/v1/',
    --                 model = 'qwen-2.5-coder-32b',
    --                 max_tokens = 18192, -- remember to increase this value, otherwise it will stop generating halfway
    --             },
    --         },
    --     },
    --     -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    --     build = "make",
    --     -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "stevearc/dressing.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "MunifTanjim/nui.nvim",
    --         --- The below dependencies are optional,
    --         "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    --         "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    --         "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    --         "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    --         "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    --         "zbirenbaum/copilot.lua",        -- for providers='copilot'
    --         {
    --             -- support for image pasting
    --             "HakonHarnes/img-clip.nvim",
    --             event = "VeryLazy",
    --             opts = {
    --                 -- recommended settings
    --                 default = {
    --                     embed_image_as_base64 = false,
    --                     prompt_for_file_name = false,
    --                     drag_and_drop = {
    --                         insert_mode = true,
    --                     },
    --                     -- required for Windows users
    --                     use_absolute_path = true,
    --                 },
    --             },
    --         },
    --         {
    --             -- Make sure to set this up properly if you have lazy=true
    --             'MeanderingProgrammer/render-markdown.nvim',
    --             opts = {
    --                 file_types = { "markdown", "Avante" },
    --             },
    --             ft = { "markdown", "Avante" },
    --         },
    --     },
    -- },
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<Tab>",
                    clear_suggestion = "<C-x>",
                    accept_word = "<C-j>",
                },
            })
        end,
    },
})
