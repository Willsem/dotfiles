local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Setup font
config.font = wezterm.font_with_fallback({
	{ family = "SF Mono", weight = "Medium" },
	{ family = "nonicons", scale = 0.95 },
})
config.font_size = 18.0
config.line_height = 1.1
config.cell_width = 0.9

-- Disable window decorations
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- Remove all paddings from the window
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Setup colorscheme
-- Vague for Wezterm
-- Upstream: https://github.com/vague-theme/vague-wezterm/blob/main/vague.lua
config.colors = {
	foreground = "#cdcdcd",
	background = "#141415",

	cursor_bg = "#cdcdcd",
	cursor_fg = "#141415",
	cursor_border = "#cdcdcd",

	selection_fg = "#cdcdcd",
	selection_bg = "#252530",

	scrollbar_thumb = "#252530",
	split = "#252530",

	ansi = {
		"#252530",
		"#d8647e",
		"#7fa563",
		"#f3be7c",
		"#6e94b2",
		"#bb9dbd",
		"#aeaed1",
		"#cdcdcd",
	},
	brights = {
		"#606079",
		"#e08398",
		"#99b782",
		"#f5cb96",
		"#8ba9c1",
		"#c9b1ca",
		"#bebeda",
		"#d7d7d7",
	},
	tab_bar = {
		background = "#141415",
		active_tab = {
			bg_color = "#252530",
			fg_color = "#cdcdcd",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#141415",
			fg_color = "#606079",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab_hover = {
			bg_color = "#252530",
			fg_color = "#cdcdcd",
			italic = false,
		},
		new_tab = {
			bg_color = "#141415",
			fg_color = "#6e94b2",
		},
		new_tab_hover = {
			bg_color = "#252530",
			fg_color = "#8ba9c1",
		},
		inactive_tab_edge = "#252530",
	},
}

return config
