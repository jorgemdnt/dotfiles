require("nvim-tree").setup()

local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>t", function ()
    api.tree.toggle(true)
end)
