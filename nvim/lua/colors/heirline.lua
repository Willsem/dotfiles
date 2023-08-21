local colors = require("catppuccin.palettes").get_palette("mocha")
colors.cyan = colors.teal
colors.orange = colors.peach
colors.purple = colors.mauve

return {
    git_add = colors.green,
    git_del = colors.red,
    git_change = colors.orange,

    git_branch = colors.mauve,

    scrollbar = colors.blue,

    error = colors.red,
    warning = colors.yellow,
    info = colors.blue,
    hint = colors.blue,

    bg = colors.mantle,
    fg = colors.subtext1,

    fg_light = colors.surface2,

    red = colors.red,
    green = colors.green,
    cyan = colors.cyan,
    orange = colors.orange,
    purple = colors.purple
}
