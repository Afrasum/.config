-- ~/.wezterm.lua --------------------------------------------------------------
local wezterm = require("wezterm")
local mux = wezterm.mux -- ← DENNE LINJEN MANGLET
local config = wezterm.config_builder()

-- === Utseende ===
config.color_scheme = "tokyonight"
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

-- Aktiver vindusdekorationer og fanebar
config.window_decorations = "RESIZE"
config.enable_tab_bar = true -- Slå på fanebaren
config.hide_tab_bar_if_only_one_tab = false -- Vis også hvis kun én fane

-- Bakgrunn og gjennomsiktighet
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

-- Valgfritt: litt padding rundt innholdet
-- config.window_padding = {
-- 	left = 2,
-- 	right = 2,
-- 	top = 2,
-- 	bottom = 2,
-- }

-- === Tast­bindinger ===
config.keys = {
	-- ⌘ ← / ⌘ →  → Ctrl-A / Ctrl-E
	{ key = "LeftArrow", mods = "CMD", action = wezterm.action.SendString("\x01") }, -- ^A
	{ key = "RightArrow", mods = "CMD", action = wezterm.action.SendString("\x05") }, -- ^E

	-- ⌥ ← / ⌥ →  → ESC b / ESC f
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.SendString("\x1bb") }, -- ESC b
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.SendString("\x1bf") }, -- ESC f

	-- ⌥⌫  → ESC DEL  (slett ord)
	{ key = "Backspace", mods = "ALT", action = wezterm.action.SendString("\x1b\x7f") },

	-- ⌘⌫  → Ctrl-U  (slett resten av linjen)
	{ key = "Backspace", mods = "CMD", action = wezterm.action.SendString("\x15") },

	-- Ny fane / lukk fane
	{ key = "T", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "W", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
}

-- === Plasser og maksimer vindu på hovedskjermen ===
wezterm.on("gui-startup", function(cmd)
	-- Spawn nytt vindu med posisjon øverst, venstre på hovedskjermen  [oai_citation:46‡WezTerm](https://wezterm.org/config/lua/wezterm.mux/spawn_window.html?utm_source=chatgpt.com) [oai_citation:47‡WezTerm](https://wezterm.org/changelog.html?utm_source=chatgpt.com)
	local tab, pane, window = mux.spawn_window({
		args = cmd or {},
		position = {
			x = 0,
			y = 0,
			origin = "MainScreen", -- Angir at x,y er i hovedskjermens koordinatsystem  [oai_citation:48‡WezTerm](https://wezterm.org/config/lua/wezterm.mux/spawn_window.html?utm_source=chatgpt.com) [oai_citation:49‡WezTerm](https://wezterm.org/changelog.html?utm_source=chatgpt.com)
		},
	})

	-- Maksimer vinduet for å fylle hele hovedskjermen  [oai_citation:50‡Stack Overflow](https://stackoverflow.com/questions/78738575/how-to-maximize-wezterm-on-startup?utm_source=chatgpt.com) [oai_citation:51‡GitHub](https://github.com/wez/wezterm/discussions/5501?utm_source=chatgpt.com) [oai_citation:52‡WezTerm](https://wezterm.org/changelog.html?utm_source=chatgpt.com)
	window:gui_window():maximize()
end)

return config
-- ---------------------------------------------------------------------------
