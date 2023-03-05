local lsp_active = require("configs.heirline.components.lsp-active")
local line_number = require("configs.heirline.components.line-number")
local scrollbar = require("configs.heirline.components.scrollbar")

local alignment = require("configs.heirline.components.alignment")
local space = alignment.space
local separator = alignment.separator

return { lsp_active, separator, line_number, space, scrollbar }
