require('lualine').setup {
    options = {
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        -- ... the rest of your lualine config
    },
    sections = {
        lualine_a = {
            {
                'mode',
                icon = ""
            }
        },
        lualine_b = {
            'branch',
            {
                'diff',
                symbols = {
                    added = "",
                    modified = "",
                    removed = "",
                }
            },
            'diagnostics'
        },
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    tabline = {
        lualine_a = { 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
    }
}
