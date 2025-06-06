local P = { groups = {}, mappings = { n = {}, v = {} } }

local telescope_builtin = require('telescope.builtin')

P.groups = {
  { prefix = '<leader>f', name = 'Find' },
  { prefix = '<leader>l', name = 'LSP' },
  { prefix = '<leader>p', name = 'Plugin manager (Lazy)' },
  { prefix = '<leader>g', name = 'Git' },
  { prefix = '<leader>t', name = 'Tests' },
  { prefix = '<leader>m', name = 'Mason' },
  { prefix = '<leader>r', name = 'HTTP' },
}

P.mappings.n['<leader>h'] = {
  desc = 'Disable search highlighting',
  cmd = '<cmd>nohlsearch<cr>',
}

-- Bufferline
P.mappings.n['<S-l>'] = {
  desc = 'Next buffer',
  cmd = '<cmd>BufferLineCycleNext<cr>',
}
P.mappings.n['<S-h>'] = {
  desc = 'Previous buffer',
  cmd = '<cmd>BufferLineCyclePrev<cr>',
}
P.mappings.n['<leader>c'] = {
  desc = 'Close buffer',
  cmd = function()
    require('bufdelete').bufdelete(0)
  end,
}
P.mappings.n['<leader>C'] = {
  desc = 'Force close buffer',
  cmd = function()
    require('bufdelete').bufdelete(0, true)
  end,
}

-- Splitting window
P.mappings.n['|'] = { desc = 'Vertical Split', cmd = '<cmd>vsplit<cr>' }
P.mappings.n['\\'] = { desc = 'Horizontal Split', cmd = '<cmd>split<cr>' }

-- Splits moving
local smartsplits = require('smart-splits')
P.mappings.n['<C-h>'] = {
  desc = 'Move to left split',
  cmd = smartsplits.move_cursor_left,
}
P.mappings.n['<C-j>'] = {
  desc = 'Move to below split',
  cmd = smartsplits.move_cursor_down,
}
P.mappings.n['<C-k>'] = {
  desc = 'Move to above split',
  cmd = smartsplits.move_cursor_up,
}
P.mappings.n['<C-l>'] = {
  desc = 'Move to right split',
  cmd = smartsplits.move_cursor_right,
}

-- Resize splits with arrows
P.mappings.n['<S-Up>'] = { desc = 'Resize split up', cmd = smartsplits.resize_up }
P.mappings.n['<S-Down>'] = {
  desc = 'Resize split down',
  cmd = smartsplits.resize_down,
}
P.mappings.n['<S-Left>'] = {
  desc = 'Resize split left',
  cmd = smartsplits.resize_left,
}
P.mappings.n['<S-Right>'] = {
  desc = 'Resize split right',
  cmd = smartsplits.resize_right,
}

-- Leader group
P.mappings.n['<leader>q'] = { desc = 'Quit', cmd = '<cmd>q<cr>' }
P.mappings.n['<leader>Q'] = { desc = 'Force quit', cmd = '<cmd>q!<cr>' }
P.mappings.n['<leader>w'] = { desc = 'Save', cmd = '<cmd>w<cr>' }
P.mappings.n['<leader>e'] = {
  desc = 'Toggle Explorer',
  cmd = '<cmd>Neotree toggle<cr>',
}

-- File group
P.mappings.n['<leader>ff'] = {
  desc = 'Find files',
  cmd = telescope_builtin.find_files,
}
P.mappings.n['<leader>fw'] = {
  desc = 'Grep files',
  cmd = telescope_builtin.live_grep,
}
P.mappings.n['<leader>fb'] = {
  desc = 'Find buffers',
  cmd = telescope_builtin.buffers,
}
P.mappings.n['<leader>fh'] = {
  desc = 'Help tags',
  cmd = telescope_builtin.help_tags,
}

-- LSP group
P.mappings.n['<leader>ld'] = {
  desc = 'Go to definition',
  cmd = vim.lsp.buf.definition,
}
P.mappings.n['gd'] = P.mappings.n['<leader>ld']

P.mappings.n['<leader>lD'] = {
  desc = 'Go to declaration',
  cmd = vim.lsp.buf.declaration,
}
P.mappings.n['gD'] = P.mappings.n['<leader>lD']

P.mappings.n['<leader>li'] = {
  desc = 'Go to implementation',
  cmd = vim.lsp.buf.implementation,
}
P.mappings.n['gi'] = P.mappings.n['<leader>li']

P.mappings.n['<leader>la'] = {
  desc = 'Code actions',
  cmd = vim.lsp.buf.code_action,
}
P.mappings.n['<leader>lr'] = {
  desc = 'Go to references',
  cmd = vim.lsp.buf.references,
}
P.mappings.n['gr'] = P.mappings.n['<leader>lr']

P.mappings.n['<leader>lR'] = { desc = 'Rename symbol', cmd = vim.lsp.buf.rename }
P.mappings.n['<leader>lh'] = { desc = 'LSP hover', cmd = vim.lsp.buf.hover }

-- Plugin manager group
local lazy = require('lazy')
P.mappings.n['<leader>pc'] = { desc = 'Check for updates', cmd = lazy.check }
P.mappings.n['<leader>pC'] = { desc = 'Clean plugins', cmd = lazy.clean }
P.mappings.n['<leader>ph'] = { desc = 'Healthcheck', cmd = lazy.health }
P.mappings.n['<leader>pp'] = { desc = 'Profile', cmd = lazy.profile }
P.mappings.n['<leader>ps'] = { desc = 'Sync', cmd = lazy.sync }
P.mappings.n['<leader>pu'] = { desc = 'Update', cmd = lazy.update }

-- Git mappings
local gitsigns = require('gitsigns')
P.mappings.n['<leader>gl'] = { desc = 'Blame line info', cmd = gitsigns.blame_line }
P.mappings.n['<leader>gd'] = { desc = 'Open git diff', cmd = gitsigns.diffthis }
P.mappings.n['<leader>gb'] = { desc = 'Toggle continuous blame line', cmd = gitsigns.toggle_current_line_blame }

-- Comment
P.mappings.n['<leader>/'] = {
  desc = 'Comment line',
  cmd = require('Comment.api').toggle.linewise.current,
}
P.mappings.v['<leader>/'] = {
  desc = 'Toggle comment line',
  cmd = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
}

--[[
-- Tests group
local neotest = require('neotest')
local neotest_run = neotest.run
local neotest_watch = neotest.watch
local neotest_summary = neotest.summary
P.mappings.n['<leader>tr'] = {
  desc = 'Run the nearest test',
  cmd = neotest_run.run
}
P.mappings.n['<leader>tR'] = {
  desc = 'Run the current file',
  cmd = function() neotest_run.run(vim.fn.expand('%')) end
}
P.mappings.n['<leader>ts'] = {
  desc = 'Stop the nearest test',
  cmd = neotest_run.stop
}
P.mappings.n['<leader>tw'] = {
  desc = 'Watch the tests',
  cmd = neotest_watch.toggle
}
P.mappings.n['<leader>to'] = {
  desc = 'Open tests summary',
  cmd = neotest_summary.open
}
--]]

-- Mason group
P.mappings.n['<leader>mo'] = {
  desc = 'Open mason window',
  cmd = '<cmd>Mason<cr>',
}
P.mappings.n['<leader>mu'] = {
  desc = 'Update mason',
  cmd = '<cmd>MasonUpdate<cr>',
}

-- HTTP group
P.mappings.n['<leader>rr'] = {
  desc = 'HTTP Request run',
  cmd = '<cmd>Rest run<cr>',
}

return P
