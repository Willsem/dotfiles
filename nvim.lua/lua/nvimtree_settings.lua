vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }

vim.g.nvim_tree_icons = {
    ['default'] = '',
    ['symlink'] = '',

    ['git'] = {
        ['unstaged'] = "✗",
        ['staged'] = "✓",
        ['unmerged'] = "",
        ['renamed'] = "➜",
        ['untracked'] = "★",
        ['deleted'] = "",
        ['ignored'] = "◌"
    },

    ['folder'] = {
        ['default'] = "",
        ['open'] = "",
        ['empty'] = "",
        ['empty_open'] = "",
        ['symlink'] = "",
        ['symlink_open'] = ""
    },

    ['lsp'] = {
        ['hint'] = "",
        ['info'] = "",
        ['warning'] = "",
        ['error'] = ""
    }
}

vim.cmd[[
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
]]
