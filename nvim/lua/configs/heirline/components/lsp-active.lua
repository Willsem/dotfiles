local conditions = require("heirline.conditions")

return {
  condition = conditions.lsp_attached,
  update = {'LspAttach', 'LspDetach'},
  provider  = function()
    local names = {}
    for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
    end
    return " " .. table.concat(names, " ")
  end,
  hl = { fg = "green", bg = "bg" },
}
