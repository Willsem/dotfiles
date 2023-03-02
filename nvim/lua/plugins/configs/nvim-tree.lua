require 'nvim-tree'.setup {
    filters = {
        custom = { '.DS_Store' }
    },
}

local keys = vim.keymap

keys.set('n', '<C-n>', ':NvimTreeToggle<CR>')
keys.set('n', '<leader>r', ':NvimTreeRefresh<CR>')
keys.set('n', '<leader>n', ':NvimTreeFindFile<CR>')
