local lspactive = require('plugins.heirline.components.lsp-active')
local treesitter = require('plugins.heirline.components.treesitter')
local linenumber = require('plugins.heirline.components.line-number')
local scrollbar = require('plugins.heirline.components.scrollbar')

return {
  lspactive,
  treesitter,
  linenumber,
  scrollbar,
}
