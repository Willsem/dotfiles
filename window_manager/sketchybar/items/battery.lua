local item = sbar.add('item', {
    position = 'right',
    update_freq = '10',
    icon = {
        drawing = true,
    },
})

local icon_battery1 = ''
local icon_battery2 = ''
local icon_battery3 = ''
local icon_battery4 = ''
local icon_battery5 = ''
local icon_charging = ''

local function battery_change()
    sbar.exec('pmset -g batt', function(batt_info)
        local icon = '!'
        local charge = 0
        local found, _, charge_data = batt_info:find('(%d+)%%')
        if found then
            charge = tonumber(charge_data)
        end

        if string.find(batt_info, 'AC Power') then
            icon = icon_charging
        else
            if found and charge > 80 then
                icon = icon_battery1
            elseif found and charge > 60 then
                icon = icon_battery2
            elseif found and charge > 40 then
                icon = icon_battery3
            elseif found and charge > 20 then
                icon = icon_battery4
            else
                icon = icon_battery5
            end
        end

        item:set({
            icon = icon,
            label = charge .. '%',
        })
    end)
end

item:subscribe({ 'routine', 'power_source_change', 'system_woke' }, battery_change)
