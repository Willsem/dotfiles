local colors = require("catppuccin.palettes").get_palette("mocha")
colors.cyan = colors.teal
colors.orange = colors.peach
colors.purple = colors.mauve

colors.git_add = colors.green
colors.git_del = colors.red
colors.git_change = colors.orange

colors.bg = colors.mantle
colors.fg = colors.subtext1

colors.fg_light = colors.surface2

return colors
