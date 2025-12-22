return {
    {
        'https://github.com/lewis6991/gitsigns.nvim',

        opts = {
            signs = {
                add = { text = '│' },
                change = { text = '│' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                untracked = { text = '┆' },
            },
            current_line_blame_opts = {
                delay = 100,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
        },
    },
}
