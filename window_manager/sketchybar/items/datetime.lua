local item = sbar.add('item', {
    position = 'right',
    update_freq = '5',
    background = {
        padding_right = 0,
    },
})

local function update()
    sbar.exec("LC_ALL=ru_RU.UTF-8 date '+%a %d %B %H:%M'", function(result, exit_code)
        item:set({ label = result })
    end)
end

item:subscribe('routine', update)
item:subscribe('forced', update)
