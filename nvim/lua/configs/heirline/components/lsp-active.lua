local alignment = require('configs.heirline.components.alignment')
local conditions = require('heirline.conditions')

return {
  condition = conditions.lsp_attached,
  {
    update = { 'LspAttach', 'LspDetach' },
    provider = function()
      local names = {}
      for _, server in pairs(vim.lsp.get_clients()) do
        table.insert(names, server.name)
      end
      return ' ' .. table.concat(names, ' ')
    end,
    hl = {
      fg = 'fg',
      bg = 'bg',
    },
  },
  alignment.separator,
}
