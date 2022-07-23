-- config: https://wezfurlong.org/wezterm/config/lua/config/index.html
local wezterm = require 'wezterm'
local act = wezterm.action
local nop = act.Nop

local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()

-- wezterm.on('window-config-reloaded', function(window, pane)
--   wezterm.log_info(string.format('config was reloaded for window: %s', window, pane))
-- end)

-- wezterm.on('toggle-ligature', function(window, pane)
--   local overrides = window:get_config_overrides() or {}
--   if not overrides.harfbuzz_features then
--     -- If we haven't overridden it yet, then override with ligatures disabled
--     overrides.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
--   else
--     -- else we did already, and we should disable out override now
--     overrides.harfbuzz_features = nil
--   end
--   window:set_config_overrides(overrides)
-- end)

wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.6
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

return {
  -- font
  font = wezterm.font_with_fallback {
    'Hack Nerd Font',
    'SauceCodePro Nerd Font',
    'JetBrainsMono Nerd Font',
    'Delugia',
    'Iosevka Nerd Font',
  },
  font_size = 16.0,
  -- custom_block_glyphs = false,
  -- theme
  -- @see <https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/wezterm>
  -- color_scheme = "Gruvbox Dark",
  -- color_scheme = "Solarized Darcula",
  -- color_scheme = "JetBrains Darcula",
  -- color_scheme = "Breeze",
  -- color_scheme = "Batman",
  -- color_scheme = "Andromeda",
  color_scheme = 'rose-pine',
  colors = colors,
  window_frame = window_frame,
  -- cursor
  default_cursor_style = 'BlinkingBar',
  cursor_blink_rate = 400,
  force_reverse_video_cursor = true,
  -- cursor_blink_ease_in = "Constant",
  -- cursor_blink_ease_out = "Constant",
  -- line
  line_height = 1.1,
  -- window
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- enable_scroll_bar = true,
  -- window_decorations = "RESIZE",
  -- window_decorations = "TITLE | RESIZE",
  window_background_opacity = 0.9,
  -- tab
  -- enable_tab_bar = false,
  -- use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  -- program
  -- default_prog = { '/usr/local/bin/fish', '-l' },
  -- launch_menu = {
  --   {
  --     args = { 'top' },
  --   },
  -- },
  -- multiplexing
  ssh_domains = {
    {
      name = 'devbox',
      remote_address = '10.37.141.94',
      username = 'yangjun.321',
    },
  },
  --
  native_macos_fullscreen_mode = true,
  -- key
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,
  use_ime = true,
  enable_csi_u_key_encoding = true,
  -- timeout_milliseconds defaults to 1000 and can be omitted
  leader = { key = ';', mods = 'CTRL', timeout_milliseconds = 1500 },
  mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
    },
  },
  -- `wezterm show-keys`
  keys = {
    -- { key = 'h', mods = 'SUPER', action = nop },
    -- { key = 'w', mods = 'SUPER', action = nop },
    -- { key = 'm', mods = 'SUPER', action = nop },
    -- { key = '+', mods = 'CTRL|SHIFT', action = nop },
    -- { key = '_', mods = 'CTRL|SHIFT', action = nop },
    -- { key = '=', mods = 'CTRL', action = nop },
    -- { key = '-', mods = 'CTRL', action = nop },
    -- TODO: super in win10
    { key = 'g', mods = 'SUPER', action = 'ShowDebugOverlay' },
    { key = 'R', mods = 'CTRL', action = 'ReloadConfiguration' },
    { key = 'Y', mods = 'CTRL', action = 'ShowDebugOverlay' },
    { key = ':', mods = 'CTRL|SHIFT', action = act.ShowLauncher },
    { key = 'p', mods = 'CTRL|SHIFT', action = act.ShowTabNavigator },
    { key = 'e', mods = 'CTRL|SHIFT', action = act.PaneSelect },
    { key = ' ', mods = 'CTRL|SHIFT', action = act.QuickSelect },
    { key = 'W', mods = 'CTRL', action = act.CloseCurrentPane { confirm = true } },
    -- { key = 'N', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'O', mods = 'CTRL', action = act.EmitEvent 'toggle-opacity' },
    -- { key = 'F', mods = 'CTRL', action = act.ToggleFullScreen },
    { key = 'G', mods = 'CTRL', action = act.Search { CaseInSensitiveString = '' } },
    { key = 'M', mods = 'CTRL', action = act.TogglePaneZoomState },
    { key = '|', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '_', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = '<', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(-1) },
    { key = '>', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(1) },
    { key = 'Tab', mods = 'CTRL', action = act.ActivateLastTab },
    -- { key = 'h', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
    -- { key = 'l', mods = 'LEADER', action = act.ActivateTabRelative(1) },
    { key = 'H', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
    { key = 'L', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = 'K', mods = 'CTRL', action = act.ScrollByPage(-0.5) },
    { key = 'J', mods = 'CTRL', action = act.ScrollByPage(0.5) },
    { key = '{', mods = 'CTRL|SHIFT', action = act.ScrollToTop },
    { key = '}', mods = 'CTRL|SHIFT', action = act.ScrollToBottom },
    -- { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
    -- { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },
    -- { key = 'UpArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
    -- { key = 'DownArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down' },
    -- { key = 'H', mods = 'LEADER', action = act.AdjustPaneSize { 'Left', 5 } },
    -- { key = 'L', mods = 'LEADER', action = act.AdjustPaneSize { 'Right', 5 } },
    -- { key = 'K', mods = 'LEADER', action = act.AdjustPaneSize { 'Up', 5 } },
    -- { key = 'J', mods = 'LEADER', action = act.AdjustPaneSize { 'Down', 5 } },
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
    { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Right', 5 } },
    { key = 'UpArrow', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'DownArrow', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Down', 5 } },
  },
}
