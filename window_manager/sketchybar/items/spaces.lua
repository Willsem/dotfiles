local colors = require('colors')
local icons = require('icons')

local function mouse_click(env)
    sbar.exec('yabai -m space --focus ' .. env.SID)
end

local function space_selection(env)
    local color = env.SELECTED == 'true' and colors.ansi.red or colors.fg

    sbar.set(env.NAME, {
        icon = {
            color = color,
        },
    })
end

local spaces = {}
for i = 1, 10, 1 do
    local space = sbar.add('space', {
        associated_space = i,
        icon = {
            string = icons.windows[tostring(i)],
            drawing = true,
            padding_left = 0,
            padding_right = 0,
            color = colors.fg,
        },
        label = {
            drawing = false,
        },
        background = {
            color = colors.transparent,
            border_color = colors.transparent,
        },
    })

    spaces[i] = space.name
    space:subscribe('space_change', space_selection)
    space:subscribe('mouse.clicked', mouse_click)
end

sbar.add('bracket', spaces, {
    background = {
        color = colors.bg,
        border_color = colors.fg,
    },
})
