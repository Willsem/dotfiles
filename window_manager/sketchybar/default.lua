local settings = require("settings")
local colors = require("colors")

sbar.default({
	updates = "when_shown",
	icon = {
		font = {
			family = settings.icon_font,
			style = "Bold",
			size = 14.0,
		},
		padding_left = 10,
		padding_right = 0,
		drawing = false,
	},
	label = {
		font = {
			family = settings.font,
			style = "Bold",
			size = 14.0,
		},
		padding_left = 10,
		padding_right = 10,
		color = colors.text,
	},
	background = {
		height = settings.height - 8,
		corner_radius = 8,
		border_width = 1,
		border_color = colors.text,
		color = colors.item_bg,
		padding_left = 6,
		padding_right = 6,
	},
})
