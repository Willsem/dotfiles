local colors = require('colors')
local icons = require('icons')

local function mouse_click(env)
    if env.BUTTON == 'right' then
        sbar.exec('yabai -m space --destroy ' .. env.SID)
    else
        sbar.exec('yabai -m space --focus ' .. env.SID)
    end
end

local function space_selection(env)
    local color = env.SELECTED == 'true' and colors.ansi.red or colors.fg

    sbar.set(env.NAME, {
        label = {
            color = color,
        },
    })
end

local spaces = {}
for i = 1, 10, 1 do
    local space = sbar.add('space', {
        associated_space = i,
        label = {
            string = icons.windows[tostring(i)],
            padding_left = 5,
            padding_right = 5,
            color = colors.fg,
        },
        background = {
            color = colors.transparent,
            border_color = colors.transparent,
        },
        padding_left = 2,
        padding_right = 2,
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

local space_creator = sbar.add('item', {
    icon = {
        padding_left = 5,
        padding_right = 5,
        drawing = true,
        string = '',
    },
    label = { drawing = false },
    associated_display = 'active',
})

space_creator:subscribe('mouse.clicked', function(_)
    sbar.exec('yabai -m space --create')
end)
