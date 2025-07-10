local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_prog = { 'nu' }
-- config.shell_integration.osc133 = true

-- Font settings
config.font_size = 12
config.line_height = 1.2
config.font = wezterm.font 'FiraCode Nerd Font'

-- Appearance
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.cursor_blink_rate = 0

config.window_decorations = 'RESIZE'
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}
config.window_background_opacity = 0.3
config.win32_system_backdrop = 'Acrylic' -- Mica, Acrylic, Tabbed

-- Miscellaneous settings
config.max_fps = 240

-- tmux
-- config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{ mods = "LEADER", key = "c",          action = wezterm.action.SpawnTab "CurrentPaneDomain", },
	{ mods = "LEADER", key = "x",          action = wezterm.action.CloseCurrentPane { confirm = true } },
	{ mods = "LEADER", key = "b",          action = wezterm.action.ActivateTabRelative(-1) },
	{ mods = "LEADER", key = "n",          action = wezterm.action.ActivateTabRelative(1) },
	{ mods = "LEADER", key = "\\",         action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } }, -- there should be |, but it doesn't work for windows
	{ mods = "LEADER", key = "-",          action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
	{ mods = "LEADER", key = "h",          action = wezterm.action.ActivatePaneDirection "Left" },
	{ mods = "LEADER", key = "j",          action = wezterm.action.ActivatePaneDirection "Down" },
	{ mods = "LEADER", key = "k",          action = wezterm.action.ActivatePaneDirection "Up" },
	{ mods = "LEADER", key = "l",          action = wezterm.action.ActivatePaneDirection "Right" },
	{ mods = "LEADER", key = "LeftArrow",  action = wezterm.action.AdjustPaneSize { "Left", 5 } },
	{ mods = "LEADER", key = "RightArrow", action = wezterm.action.AdjustPaneSize { "Right", 5 } },
	{ mods = "LEADER", key = "DownArrow",  action = wezterm.action.AdjustPaneSize { "Down", 5 } },
	{ mods = "LEADER", key = "UpArrow",    action = wezterm.action.AdjustPaneSize { "Up", 5 } },

	{ key = "a",       mods = "LEADER",    action = wezterm.action { SendString = "\x01" }, },
	{ key = "1",       mods = "LEADER",    action = wezterm.action { ActivateTab = 0 } },
	{ key = "2",       mods = "LEADER",    action = wezterm.action { ActivateTab = 1 } },
	{ key = "3",       mods = "LEADER",    action = wezterm.action { ActivateTab = 2 } },
	{ key = "4",       mods = "LEADER",    action = wezterm.action { ActivateTab = 3 } },
	{ key = "5",       mods = "LEADER",    action = wezterm.action { ActivateTab = 4 } },
	{ key = "6",       mods = "LEADER",    action = wezterm.action { ActivateTab = 5 } },
	{ key = "7",       mods = "LEADER",    action = wezterm.action { ActivateTab = 6 } },
	{ key = "8",       mods = "LEADER",    action = wezterm.action { ActivateTab = 7 } },
	{ key = "9",       mods = "LEADER",    action = wezterm.action { ActivateTab = 8 } },
	{ key = "&",       mods = "LEADER",    action = wezterm.action { CloseCurrentTab = { confirm = true } } },
}

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format {
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW }
	})
end)

config.colors = {
	tab_bar = {
		-- Цвет фона таб-бара
		background = "#1e2030",

		-- Активная вкладка
		active_tab = {
			bg_color = "#b7bdf8",
			fg_color = "#1e2030",
		},

		-- Неактивные вкладки
		inactive_tab = {
			bg_color = "#6e738d",
			fg_color = "#1e2030",
		},

		-- Новая вкладка (кнопка +)
		new_tab = {
			bg_color = "#1e2030",
			fg_color = "#6e738d",
		},
	},
}

-- Кастомный формат табов (как в tmux)
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local colors = {
		active = {
			bg = "#b7bdf8",
			fg = "#1e2030",
		},
		inactive = {
			bg = "#6e738d",
			fg = "#1e2030",
		},
	}

	local is_active = tab.is_active
	local title = tab.tab_index + 1 .. ":" .. tab.active_pane.title

	-- Обрезаем слишком длинные названия
	if #title > 20 then
		title = title:sub(1, 17) .. "..."
	end

	return {
		{ Background = { Color = is_active and colors.active.bg or colors.inactive.bg } },
		{ Text = " " .. title .. " " },
	}
end)

-- and finally, return the configuration to wezterm
return config
