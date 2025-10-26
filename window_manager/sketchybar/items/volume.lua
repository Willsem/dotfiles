local item = sbar.add("item", {
  position = "right",
  icon = {
    drawing = true,
  },
})

local function volume_change(env)
  local volume = tonumber(env.INFO)

  local icon = "󰖁"
  if volume > 60 then
    icon = "󰕾"
  elseif volume > 30 then
    icon = "󰖀"
  elseif volume > 5 then
    icon = "󰕿"
  end

  item:set({
    icon = icon,
    label = volume .. "%",
  })
end

item:subscribe("volume_change", volume_change)
