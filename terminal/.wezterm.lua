local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Setup colorscheme
config.color_scheme = "Catppuccin Frappe"

-- Setup font
config.font = wezterm.font_with_fallback({
	{ family = "SF Mono", weight = "Medium" },
	{ family = "nonicons", scale = 0.95 },
})
config.font_size = 16.0
config.line_height = 1.3
config.cell_width = 0.95

-- Disable window decorations
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- Remove all paddings from the window
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

return config
