local colors = require("colors")
local settings = require("settings")

sbar.add("event", "aerospace_workspace_change")

local spaces = {}
local itemNameToNumber = {}

local function space_change(env)
	local color = colors.text
	if itemNameToNumber[env.NAME] == tonumber(env.FOCUSED_WORKSPACE) then
		color = colors.text_selected
	end

	sbar.set(env.NAME, {
		label = {
			color = color,
		},
	})
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
