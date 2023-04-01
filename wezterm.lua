local wezterm = require("wezterm")
local act = wezterm.action
local function getDark()
	local _, stdout = wezterm.run_child_process({
		"gsettings",
		"get",
		"org.gnome.desktop.interface",
		"gtk-theme",
	})
	-- lowercase and remove whitespace
	stdout = stdout:lower():gsub("%s+", "")
	local mapping = {
		highcontrast = "LightHighContrast",
		highcontrastinverse = "DarkHighContrast",
		adwaita = "Light",
		["adwaita-dark"] = "Dark",
	}
	local appearance = mapping[stdout]
	if appearance then
		return appearance
	end
	if stdout:find("dark") or wezterm.gui.get_appearance():find("Dark") then
		return true
	end
	return false
end
local is_dark = getDark()

local colors = {
	-- Catppuccin
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
}

local function get_process(tab)
	local process_icons = {
		["docker"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["docker-compose"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["nvim"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = wezterm.nerdfonts.custom_vim },
		},
		["vim"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = wezterm.nerdfonts.dev_vim },
		},
		["node"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = wezterm.nerdfonts.mdi_hexagon },
		},
		["zsh"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wezterm.nerdfonts.dev_terminal },
		},
		["bash"] = {
			{ Foreground = { Color = colors.subtext0 } },
			{ Text = wezterm.nerdfonts.cod_terminal_bash },
		},
		["paru"] = {
			{ Foreground = { Color = colors.lavender } },
			{ Text = wezterm.nerdfonts.linux_archlinux },
		},
		["htop"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = wezterm.nerdfonts.mdi_chart_donut_variant },
		},
		["cargo"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wezterm.nerdfonts.dev_rust },
		},
		["go"] = {
			{ Foreground = { Color = colors.sapphire } },
			{ Text = wezterm.nerdfonts.mdi_language_go },
		},
		["lazydocker"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["git"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lazygit"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lua"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wezterm.nerdfonts.seti_lua },
		},
		["wget"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = wezterm.nerdfonts.mdi_arrow_down_box },
		},
		["curl"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = wezterm.nerdfonts.mdi_flattr },
		},
		["gh"] = {
			{ Foreground = { Color = colors.mauve } },
			{ Text = wezterm.nerdfonts.dev_github_badge },
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

	return wezterm.format(process_icons[process_name] or process_func())
end

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

	return current_dir == HOME_DIR and "  ~"
		or string.format("  %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end

wezterm.on("format-tab-title", function(tab)
	return wezterm.format({
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

wezterm.on("update-right-status", function(window)
	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Bold" } },
		{ Text = wezterm.strftime(" %A, %d %B %Y %H:%M ") },
	}))
end)

local ssh_domains = {}
for host, _ in pairs(wezterm.enumerate_ssh_hosts()) do
	table.insert(ssh_domains, {
		name = host,
		remote_address = host,
	})
end

return {
	front_end = "OpenGL",
	webgpu_power_preference = "HighPerformance",
	show_update_window = false,
	check_for_updates = false,
	exit_behavior = "Close",
	window_close_confirmation = "NeverPrompt",
	initial_cols = 148,
	initial_rows = 40,
	enable_scroll_bar = false,
	audible_bell = "Disabled",
	ssh_domains = ssh_domains,
	font = wezterm.font_with_fallback({ {
		family = "JetBrainsMono Nerd Font Mono",
		weight = "Medium",
	} }),
	freetype_load_flags = "NO_AUTOHINT",
	freetype_load_target = "Light",
	freetype_render_target = "HorizontalLcd",
	foreground_text_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.1,
	},
	font_size = 10,
	line_height = 1.1,
	pane_focus_follows_mouse = false,
	warn_about_missing_glyphs = false,
	tab_max_width = 50,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.9,
	window_decorations = "TITLE|RESIZE",
	window_frame = {
		active_titlebar_bg = "#1A1B26",
		inactive_titlebar_bg = "#2b2042",
		inactive_titlebar_fg = "#cccccc",
		active_titlebar_fg = "#ffffff",
		inactive_titlebar_border_bottom = "#2b2042",
		active_titlebar_border_bottom = "#2b2042",
		button_fg = "#cccccc",
		button_bg = "#1A1B26",
		button_hover_fg = "#ffffff",
		button_hover_bg = "#3b3052",
		font = require("wezterm").font("Noto Sans", { weight = "Medium" }),
		font_size = 10,
	},
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	inactive_pane_hsb = {
		saturation = 0.8,
		brightness = is_dark and 0.75 or 0.85,
	},
	color_scheme = is_dark and "Dracula" or "Dracula",
	colors = {
		cursor_fg = is_dark and colors.base or colors.crust,
		tab_bar = {
			background = "#282a36",
			active_tab = {
				bg_color = "#414868",
				fg_color = "#c0caf5",
				intensity = "Normal",
				underline = "None",
				italic = false,
				strikethrough = false,
			},
			inactive_tab = {
				bg_color = "#282a36",
				fg_color = "#a9b1d6",
			},
			inactive_tab_hover = {
				bg_color = "#6272a4",
				fg_color = "#f8f8f2",
				italic = true,
			},
			new_tab = {
				bg_color = "#282a36",
				fg_color = "#f8f8f2",
			},
			new_tab_hover = {
				bg_color = "#ff79c6",
				fg_color = "#f8f8f2",
				italic = true,
			},
		},
	},
	disable_default_key_bindings = true,
	keys = {
		{ key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
		{ key = "PageUp", mods = "CTRL", action = act.ActivateCopyMode },
		{ key = "f", mods = "SHIFT|CTRL", action = act.Search({ CaseSensitiveString = "" }) },

		{ key = "n", mods = "ALT", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "c", mods = "ALT", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "x", mods = "ALT", action = act({ CloseCurrentPane = { confirm = true } }) },
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

		{ key = "v", mods = "ALT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ key = "s", mods = "ALT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },

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
