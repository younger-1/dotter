-- config: https://wezfurlong.org/wezterm/config/lua/config/index.html
local wezterm = require "wezterm";
return {
  font = wezterm.font_with_fallback {
    "Delugia",
    "Iosevka Nerd Font",
  },
  font_size = 13.0,
  -- See: <https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/wezterm>
  -- color_scheme = "Gruvbox Dark",
  -- color_scheme = "Solarized Darcula",
  -- color_scheme = "JetBrains Darcula",
  color_scheme = "Breeze",
  default_cursor_style = "BlinkingBar",
  cursor_blink_rate = 400,
  force_reverse_video_cursor = false,
  enable_tab_bar = true,
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_decorations = "TITLE | RESIZE",
  native_macos_fullscreen_mode = false,
  send_composed_key_when_left_alt_is_pressed=false,
  send_composed_key_when_right_alt_is_pressed=false,
  use_ime = true,
  window_background_opacity = 0.9,
  enable_csi_u_key_encoding = true,
}
