require'nvim-tree'.setup {
    filters = {
        custom = { '.git', 'node_modules', '.cache', 'bin', 'obj', '.DS_Store' }
    },

    renderer = {
        indent_markers = {
            enable = true
        }
    }
}

local keys = vim.keymap

keys.set('n', '<C-n>', ':NvimTreeToggle<CR>')
keys.set('n', '<leader>r', ':NvimTreeRefresh<CR>')
keys.set('n', '<leader>n', ':NvimTreeFindFile<CR>')
