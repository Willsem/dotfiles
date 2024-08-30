local whichkey = require('which-key')
local mappings = require('core.mappings')

vim.o.timeout = true
vim.o.timeoutlen = 500

for _, group in ipairs(mappings.groups) do
  whichkey.add({ group.prefix, group = group.name })
end

for mode, maps in pairs(mappings.mappings) do
  for key, mapping in pairs(maps) do
    whichkey.add({ key, mapping.cmd, desc = mapping.desc, mode = mode })
  end
end

whichkey.setup({
  replace = { ['<leader>'] = 'SPACE' },
  icons = { breadcrumb = '»', separator = '', group = '' },
  win = {
    border = 'single',
    padding = { 2, 2, 2, 2 },
    wo = {
      winblend = 0,
    },
  },
})
