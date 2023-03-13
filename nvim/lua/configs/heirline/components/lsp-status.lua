local conditions = require("heirline.conditions")

return {
  condition = conditions.lsp_attached,
  provider = require("lsp-progress").progress,
  hl = { fg = "fg_light", bg = "bg" },
}
