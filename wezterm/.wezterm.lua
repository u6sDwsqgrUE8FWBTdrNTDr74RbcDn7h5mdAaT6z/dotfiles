local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'tokyonight_night'
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- Disables ligatures
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.disable_default_key_bindings = true
config.keys = {
  { key = "-",        mods = "CTRL",  action = act.DecreaseFontSize },
  { key = "+",        mods = "CTRL",  action = act.IncreaseFontSize },
  { key = "0",        mods = "CTRL",  action = act.ResetFontSize},
  { key = "P",        mods = "CTRL",  action = act.ActivateCommandPalette },
  { key = "V",        mods = "CTRL",  action = act.PasteFrom("Clipboard") },
  { key = "Copy",     mods = "NONE",  action = act.CopyTo("Clipboard") },
  { key = "Paste",    mods = "NONE",  action = act.PasteFrom("Clipboard") },
  { key = "F11",      mods = "NONE",  action = act.ToggleFullScreen },
}

return config
