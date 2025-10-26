local colors = require("colors")
local settings = require("settings")
local icons = require("icons")

sbar.add("event", "aerospace_workspace_change")

local spaces = {}
local itemNameToNumber = {}

local function space_change(env)
	local color = colors.text
	local num = itemNameToNumber[env.NAME]
	if num == tonumber(env.FOCUSED_WORKSPACE) then
		color = colors.text_selected
	end

	sbar.exec("aerospace list-windows --workspace " .. num .. " --format '%{app-name}'", function(result, code)
		local label = num
		for s in result:gmatch("[^\r\n]+") do
			local icon = icons.apps[s]
			if icon ~= nil then
				label = label .. " " .. icon
			else
				label = label .. ' "' .. s .. '"'
			end
		end
		sbar.set(env.NAME, {
			label = {
				string = label,
				color = color,
			},
		})
	end)
end

local function mouse_click(env)
	sbar.exec("aerospace workspace " .. itemNameToNumber[env.NAME])
end

for i = 1, 10, 1 do
	local item = sbar.add("item", {
		position = "left",
		label = {
			string = i,
			padding_left = 8,
			padding_right = 8,
		},
		background = {
			color = colors.transparent,
			border_width = 0,
			padding_left = 0,
			padding_right = 0,
		},
		icon = {
			padding_left = 0,
			padding_right = 0,
		},
	})

	spaces[i] = item.name
	itemNameToNumber[item.name] = i

	item:subscribe("aerospace_workspace_change", space_change)
	item:subscribe("mouse.clicked", mouse_click)
end

sbar.add("bracket", spaces, {
	position = "left",
})
