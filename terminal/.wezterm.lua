local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Setup colorscheme
config.color_scheme_dirs = { "/Users/aostepanov/.wezterm_colorschemes" }
config.color_scheme = "OneDark (base16)"

-- Setup font
config.font = wezterm.font("VictorMono Nerd Font", { weight = "Bold" })
config.font_size = 16.0

-- Disable window decorations
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- Remove all paddings from the window
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

return config
