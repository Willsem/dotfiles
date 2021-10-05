local g = vim.g;

g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', 'bin', 'obj', '.DS_Store' }
g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }
g.nvim_tree_indent_markers = 1

vim.cmd[[
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
]]

require('nvim-tree').setup {}
