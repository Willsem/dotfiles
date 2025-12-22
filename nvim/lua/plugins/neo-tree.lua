return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        lazy = false,

        opts = {
            popup_border_style = '',
            default_component_configs = {
                indent = {
                    indent_marker = '│',
                    last_indent_marker = '╰',
                },
                icon = {
                    folder_closed = '',
                    folder_open = '',
                    folder_empty = '',
                },
            },
            window = {
                mappings = {
                    ['<space>'] = false,
                    ['o'] = 'open',
                    ['oc'] = 'noop',
                    ['od'] = 'noop',
                    ['og'] = 'noop',
                    ['om'] = 'noop',
                    ['on'] = 'noop',
                    ['os'] = 'noop',
                    ['ot'] = 'noop',
                    ['H'] = 'prev_source',
                    ['L'] = 'next_source',
                },
            },
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
                window = {
                    mappings = {
                        ['h'] = 'toggle_hidden',
                    },
                },
            },
            event_handlers = {
                {
                    event = 'file_open_requested',
                    handler = function()
                        require('neo-tree.command').execute({ action = 'close' })
                    end,
                },
            },
        },
    },
}
