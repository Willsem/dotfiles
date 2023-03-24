local lsp_active = require("configs.heirline.components.lsp-active")
local treesitter = require("configs.heirline.components.treesitter")
local line_number = require("configs.heirline.components.line-number")
local scrollbar = require("configs.heirline.components.scrollbar")
local vi_mode = require("configs.heirline.components.vi-mode")

local alignment = require("configs.heirline.components.alignment")
local space = alignment.space
local separator = alignment.separator

return {
    lsp_active, separator, treesitter, separator, line_number, space, scrollbar,
    space, vi_mode
}
