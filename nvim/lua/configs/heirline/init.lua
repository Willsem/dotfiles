local colors = require("colors.heirline")
require("heirline").load_colors(colors)

local alignment = require("configs.heirline.components.alignment")
local align = alignment.align
local space = alignment.space

local left_section = require("configs.heirline.left-section")
local right_section = require("configs.heirline.right-section")

require("heirline").setup({
  statusline = {
    space, left_section, align, right_section, space,
  },
})
