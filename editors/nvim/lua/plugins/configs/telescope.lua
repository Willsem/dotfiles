local keys = vim.keymap

keys.set('n', '<leader>ff', function() require'telescope.builtin'.find_files() end)
keys.set('n', '<leader>fg', function() require'telescope.builtin'.live_grep() end)
keys.set('n', '<leader>fb', function() require'telescope.builtin'.buffers() end)
keys.set('n', '<leader>fh', function() require'telescope.builtin'.help_tags() end)
