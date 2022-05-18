local keys = vim.keymap

keys.set('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files()<cr>")
keys.set('n', '<leader>fg', "<cmd>lua require'telescope.builtin'.live_grep()<cr>")
keys.set('n', '<leader>fb', "<cmd>lua require'telescope.builtin'.buffers()<cr>")
keys.set('n', '<leader>fh', "<cmd>lua require'telescope.builtin'.help_tags()<cr>")
