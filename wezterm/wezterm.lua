local wezterm = require("wezterm")
local config = {}

-- config_builder helps provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- font
config.font = "Sarasa Term SC Nerd"
config.font_size = 12.0
config.line_height = 1.05
config.cell_width = 1

config.color_scheme = "AdventureTime"

return config
