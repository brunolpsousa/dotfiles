local wez = require("wezterm")
local act = wez.action
local isDark = wez.gui.get_appearance():find("Dark")

local colors = {
	dark = {
		theme = "Dracula (Official)",
		in_brightness = 0.75,

		rosewater = "#f5e0dc",
		flamingo = "#f2cdcd",
		pink = "#f5c2e7",
		mauve = "#cba6f7",
		red = "#f38ba8",
		maroon = "#eba0ac",
		peach = "#fab387",
		yellow = "#f9e2af",
		green = "#a6e3a1",
		teal = "#94e2d5",
		sky = "#89dceb",
		sapphire = "#74c7ec",
		blue = "#89b4fa",
		lavender = "#b4befe",

		text = "#cdd6f4",
		subtext1 = "#bac2de",
		subtext0 = "#a6adc8",
		overlay2 = "#9399b2",
		overlay1 = "#7f849c",
		overlay0 = "#6c7086",
		surface2 = "#585b70",
		surface1 = "#45475a",
		surface0 = "#313244",

		base = "#1e1e2e",
		mantle = "#181825",
		crust = "#11111b",

		ac_title_bg = "#1A1B26",
		ac_title_fg = "#f8f8f2",
		inac_title_bg = "#2b2042",
		inac_title_fg = "#cccccc",
		ac_title_border = "#2b2042",
		inac_title_border = "#2b2042",
		button_bg = "#1a1b26",
		button_fg = "#cccccc",
		button_hover_bg = "#3b3052",
		button_hover_fg = "#f8f8f2",
		tab_bg = "#282a36",
		tab_ac_bg = "#414868",
		tab_ac_fg = "#c0caf5",
		tab_inac_bg = "#282a36",
		tab_inac_fg = "#a9b1d6",
		tab_btn_bg = "#282a36",
		tab_btn_fg = "#f8f8f2",
	},

	light = {
		theme = "Catppuccin Latte",
		in_brightness = 0.85,

		rosewater = "#dc8a78",
		flamingo = "#dd7878",
		pink = "#ea76cb",
		mauve = "#8839ef",
		red = "#d20f39",
		maroon = "#e64553",
		peach = "#fe640b",
		yellow = "#df8e1d",
		green = "#40a02b",
		teal = "#179299",
		sky = "#04a5e5",
		sapphire = "#209fb5",
		blue = "#1e66f5",
		lavender = "#7287fd",

		text = "#4c4f69",
		subtext1 = "#5c5f77",
		subtext0 = "#6c6f85",
		overlay2 = "#7c7f93",
		overlay1 = "#8c8fa1",
		overlay0 = "#9ca0b0",
		surface2 = "#acb0be",
		surface1 = "#bcc0cc",
		surface0 = "#ccd0da",

		base = "#eff1f5",
		mantle = "#e6e9ef",
		crust = "#dce0e8",

		ac_title_bg = "#eff1f5",
		ac_title_fg = "#041A40",
		inac_title_bg = "#dce0e8",
		inac_title_fg = "#4c4f69",
		ac_title_border = "#e6e9ef",
		inac_title_border = "#dce0e8",
		button_bg = "#eff1f5",
		button_fg = "#3b3052",
		button_hover_bg = "#7287fd",
		button_hover_fg = "#f8f8f2",
		tab_bg = "#e6e9ef",
		tab_ac_bg = "#eff1f5",
		tab_ac_fg = "#3b3052",
		tab_inac_bg = "#dce0e8",
		tab_inac_fg = "#3b3052",
		tab_btn_bg = "#e6e9ef",
		tab_btn_fg = "#3b3052",
	},
}

colors = isDark and colors.dark or colors.light

local function get_process(tab)
	local process_icons = {
		["docker"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wez.nerdfonts.linux_docker },
		},
		["docker-compose"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wez.nerdfonts.linux_docker },
		},
		["nvim"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = wez.nerdfonts.custom_vim },
		},
		["vim"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = wez.nerdfonts.dev_vim },
		},
		["node"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = wez.nerdfonts.mdi_hexagon },
		},
		["zsh"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wez.nerdfonts.dev_terminal },
		},
		["bash"] = {
			{ Foreground = { Color = colors.subtext0 } },
			{ Text = wez.nerdfonts.cod_terminal_bash },
		},
		["paru"] = {
			{ Foreground = { Color = colors.lavender } },
			{ Text = wez.nerdfonts.linux_archlinux },
		},
		["htop"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = wez.nerdfonts.mdi_chart_donut_variant },
		},
		["cargo"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wez.nerdfonts.dev_rust },
		},
		["go"] = {
			{ Foreground = { Color = colors.sapphire } },
			{ Text = wez.nerdfonts.mdi_language_go },
		},
		["lazydocker"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wez.nerdfonts.linux_docker },
		},
		["git"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wez.nerdfonts.dev_git },
		},
		["lazygit"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wez.nerdfonts.dev_git },
		},
		["lua"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wez.nerdfonts.seti_lua },
		},
		["wget"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = wez.nerdfonts.mdi_arrow_down_box },
		},
		["curl"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = wez.nerdfonts.mdi_flattr },
		},
		["gh"] = {
			{ Foreground = { Color = colors.mauve } },
			{ Text = wez.nerdfonts.dev_github_badge },
		},
	}

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
	local function process_func()
		local process_string = { { Foreground = { Color = colors.sky } }, { Text = string.format("%s", process_name) } }
		if string.format("%s", process_name) == "" then
			return process_icons["zsh"]
		else
			return process_string
		end
	end
	return wez.format(process_icons[process_name] or process_func())
end

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))
	return current_dir == HOME_DIR and "  ~"
		or string.format("  %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end

wez.on("format-tab-title", function(tab)
	return wez.format({
		{ Attribute = { Intensity = "Half" } },
		{ Text = string.format(" %s  ", tab.tab_index + 1) },
		"ResetAttributes",
		{ Text = get_process(tab) },
		{ Text = " " },
		{ Text = get_current_working_dir(tab) },
		{ Foreground = { Color = colors.base } },
		{ Text = "  ▕" },
	})
end)

wez.on("update-right-status", function(window)
	window:set_right_status(wez.format({
		{ Attribute = { Intensity = "Bold" } },
		{ Text = wez.strftime(" %A, %d %B %Y %H:%M ") },
	}))
end)

local ssh_domains = {}
for host, _ in pairs(wez.enumerate_ssh_hosts()) do
	table.insert(ssh_domains, {
		name = host,
		remote_address = host,
	})
end

return {
	show_update_window = false,
	check_for_updates = false,
	exit_behavior = "Close",
	window_close_confirmation = "NeverPrompt",
	initial_cols = 166,
	initial_rows = 48,
	enable_scroll_bar = false,
	audible_bell = "Disabled",
	ssh_domains = ssh_domains,
	warn_about_missing_glyphs = false,
	font = wez.font_with_fallback({ {
		family = "JetBrainsMono Nerd Font Mono",
		weight = "Medium",
	} }),
	-- freetype_load_target = "Light",
	-- freetype_render_target = "HorizontalLcd",
	font_size = 10,
	line_height = 1.0,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.95,
	foreground_text_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	window_frame = {
		active_titlebar_bg = colors.ac_title_bg,
		active_titlebar_fg = colors.ac_title_fg,
		inactive_titlebar_bg = colors.inac_title_bg,
		inactive_titlebar_fg = colors.inac_title_fg,
		active_titlebar_border_bottom = colors.ac_title_border,
		inactive_titlebar_border_bottom = colors.inac_title_border,
		button_bg = colors.button_bg,
		button_fg = colors.button_fg,
		button_hover_bg = colors.button_hover_bg,
		button_hover_fg = colors.button_hover_fg,
		font = wez.font("Noto Sans", { weight = "Medium" }),
		font_size = 9,
	},
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	inactive_pane_hsb = {
		saturation = 0.8,
		brightness = colors.in_brightness,
	},
	color_scheme = colors.theme,
	colors = {
		tab_bar = {
			background = colors.tab_bg,
			active_tab = {
				bg_color = colors.tab_ac_bg,
				fg_color = colors.tab_ac_fg,
				intensity = "Normal",
				underline = "None",
				italic = false,
				strikethrough = false,
			},
			inactive_tab = {
				bg_color = colors.tab_inac_bg,
				fg_color = colors.tab_inac_fg,
			},
			inactive_tab_hover = {
				bg_color = colors.tab_inac_bg,
				fg_color = colors.tab_inac_fg,
				italic = true,
			},
			new_tab = {
				bg_color = colors.tab_btn_bg,
				fg_color = colors.tab_btn_fg,
			},
			new_tab_hover = {
				bg_color = "#6272a4",
				fg_color = "#f8f8f2",
				italic = true,
			},
		},
	},
	disable_default_key_bindings = true,
	keys = {
		{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "PageUp", mods = "CTRL", action = act.ActivateCopyMode },
		{ key = "f", mods = "SHIFT|CTRL", action = act.Search({ CaseSensitiveString = "" }) },

		{ key = "t", mods = "CTRL|SHIFT", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "w", mods = "CTRL|SHIFT", action = act({ CloseCurrentPane = { confirm = true } }) },
		{ key = "Tab", mods = "CTRL|SHIFT", action = act({ ActivateTabRelative = -1 }) },
		{ key = "[", mods = "CTRL", action = act({ ActivateTabRelative = -1 }) },
		{ key = "Tab", mods = "CTRL", action = act({ ActivateTabRelative = 1 }) },
		{ key = "]", mods = "CTRL", action = act({ ActivateTabRelative = 1 }) },
		{ key = "PageUp", mods = "CTRL|SHIFT", action = act.MoveTabRelative(-1) },
		{ key = "{", mods = "CTRL|SHIFT", action = act.MoveTabRelative(-1) },
		{ key = "PageDown", mods = "CTRL|SHIFT", action = act.MoveTabRelative(1) },
		{ key = "}", mods = "CTRL|SHIFT", action = act.MoveTabRelative(1) },

		{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
		{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
		{ key = "F11", mods = "", action = act.ToggleFullScreen },
		{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
		{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },
		{ key = "l", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },

		{ key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
		{ key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },
		{ key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
		{ key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },

		{ key = "LeftArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "DownArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "UpArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "RightArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Right", 1 }) },

		{ key = "(", mods = "CTRL|SHIFT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ key = ")", mods = "CTRL|SHIFT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },

		{ key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
		{ key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
		{ key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
		{ key = "4", mods = "ALT", action = act({ ActivateTab = 3 }) },
		{ key = "5", mods = "ALT", action = act({ ActivateTab = 4 }) },
		{ key = "6", mods = "ALT", action = act({ ActivateTab = 5 }) },
		{ key = "7", mods = "ALT", action = act({ ActivateTab = 6 }) },
		{ key = "8", mods = "ALT", action = act({ ActivateTab = 7 }) },
		{ key = "9", mods = "ALT", action = act({ ActivateTab = -1 }) },
	},
}
