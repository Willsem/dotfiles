local map = vim.keymap.set
local utils = require('utils')
local telescope_builtin = require('telescope.builtin')
local smart_splits = require('smart-splits')
local hlslens = require('hlslens')
local kopts = { noremap = true, silent = true }
local gitsigns = require('gitsigns')

map('n', '<leader>o', function()
    vim.cmd('update')
    vim.cmd('source')
end)

map('n', '<leader>w', function()
    vim.cmd('write')
end)

map('n', '<leader>q', function()
    vim.cmd('quit')
end)

map('n', '<leader>h', function()
    vim.cmd('nohlsearch')
end)

map('n', '<leader>lh', vim.lsp.buf.hover)
map('n', '<leader>lR', vim.lsp.buf.rename)
map('n', '<leader>la', vim.lsp.buf.code_action)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gr', vim.lsp.buf.references)
map('n', 'gi', vim.lsp.buf.implementation)

map('n', '<leader>e', utils.open_explorer)

map('n', '<leader>ff', telescope_builtin.find_files)
map('n', '<leader>fw', telescope_builtin.live_grep)
map('n', '<leader>fb', telescope_builtin.buffers)
map('n', '<leader>fh', telescope_builtin.help_tags)

map('n', '<C-h>', smart_splits.move_cursor_left)
map('n', '<C-j>', smart_splits.move_cursor_down)
map('n', '<C-k>', smart_splits.move_cursor_up)
map('n', '<C-l>', smart_splits.move_cursor_right)

map('n', 'n', function()
    vim.cmd("execute('normal! ' . v:count1 . 'n')")
    hlslens.start()
end, kopts)
map('n', 'N', function()
    vim.cmd("execute('normal! ' . v:count1 . 'N')")
    hlslens.start()
end, kopts)
map('n', '*', function()
    vim.cmd('normal! *')
    hlslens.start()
end, kopts)
map('n', '#', function()
    vim.cmd('normal! #')
    hlslens.start()
end, kopts)
map('n', 'g*', function()
    vim.cmd('normal! g*')
    hlslens.start()
end, kopts)
map('n', 'g#', function()
    vim.cmd('normal! g#')
    hlslens.start()
end, kopts)

map('n', '<leader>rr', function()
    vim.cmd('vertical Rest run')
end)

map('n', '<leader>/', function()
    vim.cmd('normal gcc')
end, { desc = 'Toggle line comment' })

map('v', '<leader>/', function()
    vim.cmd('normal gc')
end, { desc = 'Toggle visual comment' })

map('n', 'L', function()
    vim.cmd('bnext')
end)

map('n', 'H', function()
    vim.cmd('bprevious')
end)

map('n', '<leader>c', function()
    vim.cmd('bdelete')
end)

map('n', '<leader>gl', gitsigns.blame_line)
map('n', '<leader>gd', gitsigns.diffthis)
map('n', '<leader>gb', gitsigns.toggle_current_line_blame)

map('n', '<leader>p', function()
    vim.cmd('Lazy')
end)

map('n', '-', function()
    vim.cmd('split')
end)

map('n', '|', function()
    vim.cmd('vsplit')
end)

map('n', 'YY', function()
    vim.cmd('normal "+yy')
end)

map('v', 'Y', function()
    vim.cmd('normal "+y')
end)

map({ 'n', 'v' }, 'P', function()
    vim.cmd('normal "+p')
end)
