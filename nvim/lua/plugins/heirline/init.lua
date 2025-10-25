return {
  'rebelot/heirline.nvim',
  event = 'UiEnter',

  config = function()
    local colors = require('colors.heirline')
    local heirline = require('heirline')

    heirline.load_colors(colors)

    local alignment = require('plugins.heirline.components.alignment')
    local align = alignment.align

    local left_section = require('plugins.heirline.left-section')
    local middle_section = require('plugins.heirline.middle-section')
    local right_section = require('plugins.heirline.right-section')

    heirline.setup({
      statusline = { left_section, align, middle_section, align, right_section },
    })
  end,
}
