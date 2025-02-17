local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = 'Tomorrow Night'
config.window_background_gradient = {
  orientation = 'Vertical',
  colors = {
    '#0D1707',
    '#23161A',
  }
}
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true
config.pane_focus_follows_mouse = true
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

config.font = wezterm.font {
  family = 'VictorMono Nerd Font',
  weight = 'Medium',
}
config.font_size = 12

config.scrollback_lines = 5000
config.use_dead_keys = false
config.adjust_window_size_when_changing_font_size = false
config.window_frame = {
  font = wezterm.font { family = 'Noto Sans', weight = 'Regular'},
}
config.disable_default_key_bindings = true
config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
  { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'Clipboard' },
  { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },
  { key = 'т', mods = 'LEADER', action = act.ActivateTabRelative(1) },
  { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = 'з', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
  { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
  { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
  { key = '\'', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'd', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'в', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left', },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right', },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down', },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up', },
  { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'с', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'b', mods = 'LEADER|CTRL', action = act.SendString '\x02', },
  { key = 'Enter', mods = 'LEADER', action = act.ActivateCopyMode, },
  { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState, },
  { key = ';', mods = 'LEADER', action = act.ActivatePaneDirection('Prev'),},
  { key = 'o', mods = 'LEADER', action = act.ActivatePaneDirection('Next'),},
  { key = ',',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(
        function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end
    ),
    },
  },
  -- Close tab
  { key = '&', mods = 'LEADER|SHIFT', action = act.CloseCurrentTab{ confirm = true }},
  { key = 'w', mods = 'LEADER', action = act.ShowTabNavigator, },
  { key = '[', mods = 'LEADER', action = act.ActivateCopyMode, },
  { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, },
  { key = '{', mods = 'LEADER|SHIFT', action = act.PaneSelect { mode = 'SwapWithActiveKeepFocus' }},
}

config.key_tables = {
resize_pane = {
    { key = 'h', mods = 'NONE', action = act.AdjustPaneSize { 'Left', 1 }},
    { key = 'l', mods = 'NONE', action = act.AdjustPaneSize { 'Right', 1 }},
    { key = 'k', mods = 'NONE', action = act.AdjustPaneSize { 'Up', 1 }},
    { key = 'j', mods = 'NONE', action = act.AdjustPaneSize { 'Down', 1 }},
    { key = 'h', mods = 'SHIFT', action = act.AdjustPaneSize { 'Left', 5 }},
    { key = 'l', mods = 'SHIFT', action = act.AdjustPaneSize { 'Right', 5 }},
    { key = 'k', mods = 'SHIFT', action = act.AdjustPaneSize { 'Up', 5 }},
    { key = 'j', mods = 'SHIFT', action = act.AdjustPaneSize { 'Down', 5 }},
    { key = 'Escape', action = 'PopKeyTable' },
  },
copy_mode = {
      { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord', },
      { key = 'Escape', mods = 'NONE', action = act.Multiple { { CopyMode = 'Close' }, }, },
      { key = 'Space', mods = 'NONE', action = act.CopyMode { SetSelectionMode = 'Cell' }, },
      { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent', },
      { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent', },
      { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
      { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
      { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
      {
        key = 'F',
        mods = 'NONE',
        action = act.CopyMode { JumpBackward = { prev_char = false } },
      },
      {
        key = 'F',
        mods = 'SHIFT',
        action = act.CopyMode { JumpBackward = { prev_char = false } },
      },
      {
        key = 'G',
        mods = 'NONE',
        action = act.CopyMode 'MoveToScrollbackBottom',
      },
      {
        key = 'G',
        mods = 'SHIFT',
        action = act.CopyMode 'MoveToScrollbackBottom',
      },
      { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
      {
        key = 'H',
        mods = 'SHIFT',
        action = act.CopyMode 'MoveToViewportTop',
      },
      {
        key = 'L',
        mods = 'NONE',
        action = act.CopyMode 'MoveToViewportBottom',
      },
      {
        key = 'L',
        mods = 'SHIFT',
        action = act.CopyMode 'MoveToViewportBottom',
      },
      {
        key = 'M',
        mods = 'NONE',
        action = act.CopyMode 'MoveToViewportMiddle',
      },
      {
        key = 'M',
        mods = 'SHIFT',
        action = act.CopyMode 'MoveToViewportMiddle',
      },
      {
        key = 'O',
        mods = 'NONE',
        action = act.CopyMode 'MoveToSelectionOtherEndHoriz',
      },
      {
        key = 'O',
        mods = 'SHIFT',
        action = act.CopyMode 'MoveToSelectionOtherEndHoriz',
      },
      {
        key = 'T',
        mods = 'NONE',
        action = act.CopyMode { JumpBackward = { prev_char = true } },
      },
      {
        key = 'T',
        mods = 'SHIFT',
        action = act.CopyMode { JumpBackward = { prev_char = true } },
      },
      {
        key = 'V',
        mods = 'NONE',
        action = act.CopyMode { SetSelectionMode = 'Line' },
      },
      {
        key = 'V',
        mods = 'SHIFT',
        action = act.CopyMode { SetSelectionMode = 'Line' },
      },
      {
        key = '^',
        mods = 'NONE',
        action = act.CopyMode 'MoveToStartOfLineContent',
      },
      {
        key = '^',
        mods = 'SHIFT',
        action = act.CopyMode 'MoveToStartOfLineContent',
      },
      { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
      {
        key = 'c',
        mods = 'CTRL',
        action = act.CopyMode 'Close'
      },
      {
        key = 'd',
        mods = 'CTRL',
        action = act.CopyMode { MoveByPage = 0.5 },
      },
      {
        key = 'e',
        mods = 'NONE',
        action = act.CopyMode 'MoveForwardWordEnd',
      },
      {
        key = 'f',
        mods = 'NONE',
        action = act.CopyMode { JumpForward = { prev_char = false } },
      },
      { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
      { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
      {
        key = 'g',
        mods = 'NONE',
        action = act.CopyMode 'MoveToScrollbackTop',
      },
      {
        key = 'g',
        mods = 'CTRL',
        action = act.CopyMode 'Close'
      },
      { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
      { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      {
        key = 'm',
        mods = 'ALT',
        action = act.CopyMode 'MoveToStartOfLineContent',
      },
      {
        key = 'o',
        mods = 'NONE',
        action = act.CopyMode 'MoveToSelectionOtherEnd',
      },
      {
        key = 'q',
        mods = 'NONE',
        action = act.CopyMode 'Close'
      },
      {
        key = 't',
        mods = 'NONE',
        action = act.CopyMode { JumpForward = { prev_char = true } },
      },
      {
        key = 'u',
        mods = 'CTRL',
        action = act.CopyMode { MoveByPage = -0.5 },
      },
      {
        key = 'v',
        mods = 'NONE',
        action = act.CopyMode { SetSelectionMode = 'Cell' },
      },
      {
        key = 'v',
        mods = 'CTRL',
        action = act.CopyMode { SetSelectionMode = 'Block' },
      },
      { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      {
        key = 'Enter',
        mods = 'NONE',
        action = act.Multiple {
          { CopyTo = 'ClipboardAndPrimarySelection' },
          { CopyMode = 'Close' },
        },
      },
      {
        key = 'y',
        mods = 'NONE',
        action = act.Multiple {
          { CopyTo = 'ClipboardAndPrimarySelection' },
          { CopyMode = 'Close' },
        },
      },
      { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
      { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
      {
        key = 'End',
        mods = 'NONE',
        action = act.CopyMode 'MoveToEndOfLineContent',
      },
      {
        key = 'Home',
        mods = 'NONE',
        action = act.CopyMode 'MoveToStartOfLine',
      },
      { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      {
        key = 'LeftArrow',
        mods = 'ALT',
        action = act.CopyMode 'MoveBackwardWord',
      },
      {
        key = 'RightArrow',
        mods = 'NONE',
        action = act.CopyMode 'MoveRight',
      },
      {
        key = 'RightArrow',
        mods = 'ALT',
        action = act.CopyMode 'MoveForwardWord',
      },
      { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    },
}

return config
