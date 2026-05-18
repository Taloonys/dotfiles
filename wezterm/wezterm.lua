local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.default_prog = { 'powershell.exe' }
config.default_prog = { 'nu' }
config.colors = require("cyberdream")

-- prevent wezterm to use it's own ssh-mechanics (cringe)
config.mux_enable_ssh_agent = false

config.window_close_confirmation = "NeverPrompt"

-- Font settings
config.tab_max_width = 30
config.font_size = 12
config.line_height = 1.2
config.font = wezterm.font("FiraCode Nerd Font")

-- Appearance
config.hide_tab_bar_if_only_one_tab = true
-- config.enable_tab_bar = false
config.use_fancy_tab_bar = false
-- config.tab_and_split_indices_are_zero_based = true
-- config.cursor_blink_rate = 0

config.window_decorations = 'RESIZE'
config.window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
}

config.window_background_opacity = 0.8
-- config.win32_system_backdrop = 'Tabbed' -- Mica, Acrylic, Tabbed

-- Miscellaneous settings
config.max_fps = 240

return config
