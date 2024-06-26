local colors = require('colors.heirline')
local heirline = require('heirline')

heirline.load_colors(colors)

local alignment = require('configs.heirline.components.alignment')
local align = alignment.align

local left_section = require('configs.heirline.left-section')
local middle_section = require('configs.heirline.middle-section')
local right_section = require('configs.heirline.right-section')

heirline.setup({
  statusline = { left_section, align, middle_section, align, right_section },
})
