local colors = require('colors')
local settings = require('settings')

sbar.bar({
    height = settings.height,
    color = colors.bar_bg,
    sticky = true,
    topmost = 'window',
    position = 'top',
    padding_right = 15,
    padding_left = 15,
    corner_radius = 0,
    y_offset = 0,
    margin = 0,
    blur_radius = 20,
    notch_width = 188,
})
