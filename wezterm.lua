local wezterm = require 'wezterm'

-- 开关控制双击 Esc 关闭功能
local enable_escape_double_click_to_quit = true  -- 设置为 true 启用，false 禁用

-- 选择合适的配色
local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return {
      color_scheme = "deep",
      titlebar_bg = "#1E1E1E", -- 深色模式标题栏
      tab_bar_bg = "#282C34",  -- 深色模式标签栏
      inactive_tab_bg = "#3E4451",
      inactive_tab_fg = "#ABB2BF",
      new_tab_bg = "#3E4451",
      new_tab_hover_bg = "#61AFEF",
      button_fg = "#CCCCCC",  -- 按钮颜色（灰色）
    }
  else
    return {
      color_scheme = "dawnfox",  -- 浅色模式的配色方案
      titlebar_bg = "#f0d695",  -- **橙色标题栏**
      tab_bar_bg = "#9a8878",  -- **淡灰色标签栏**
      inactive_tab_bg = "#D6D6D6", -- 浅灰色未选中标签
      inactive_tab_fg = "#4A4A4A", -- 深灰色文字
      new_tab_bg = "#D6D6D6",  -- 浅色模式新建标签按钮
      new_tab_hover_bg = "#C0C0C0", -- 浅色模式下悬停颜色
      button_fg = "#555555",  -- 按钮颜色（更深的灰色）
    }
  end
end

-- 获取当前系统的主题
local appearance = wezterm.gui.get_appearance()
local theme = scheme_for_appearance(appearance)

-- 双击 Esc 关闭功能
local function double_click_esc_to_quit(window, pane)
  if enable_escape_double_click_to_quit then
    local overrides = window:get_config_overrides() or {}
    if overrides.esc_pressed then
      window:perform_action(wezterm.action.QuitApplication, pane)
    else
      overrides.esc_pressed = true
      window:set_config_overrides(overrides)
      wezterm.time.call_after(0.5, function()
        overrides.esc_pressed = false
        window:set_config_overrides(overrides)
      end)
    end
  end
end

return {
  initial_rows = 35,  -- 设置初始行数
  initial_cols = 115, -- 设置初始列数
  font = wezterm.font("Hack Nerd Font Mono"),
  font_size = 16.0,
  color_scheme = theme.color_scheme, -- 自动切换配色方案

  window_background_opacity = 1,  -- 窗口透明度

  -- 自动切换标题栏颜色
  window_frame = {
    active_titlebar_bg = theme.titlebar_bg,   -- 活动窗口标题栏背景
    inactive_titlebar_bg = theme.titlebar_bg, -- 非活动窗口标题栏背景
    button_fg = theme.button_fg,  -- 按钮颜色（图标颜色）
  },

  -- 自动切换标签栏颜色
  colors = {
    tab_bar = {
      background = theme.tab_bar_bg, -- 标签栏背景色

      -- 未选中标签
      inactive_tab = {
        bg_color = theme.inactive_tab_bg,
        fg_color = theme.inactive_tab_fg,
      },
       -- 未选中标签悬停颜色
      inactive_tab_hover = {
        bg_color = '#2983bb',
        fg_color = '#ffffff',
      },

      -- 选中标签（深色模式下不变）
      active_tab = {
        bg_color = "#98c379",
        fg_color = "#282c34",
      },

      -- 新建标签按钮颜色
      new_tab = {
        bg_color = theme.new_tab_bg,
        fg_color = theme.inactive_tab_fg,
      },

      -- 新建标签按钮悬停颜色
      new_tab_hover = {
        bg_color = theme.new_tab_hover_bg,
        fg_color = "#ffffff",
      },
    },
  },

  window_decorations = "RESIZE",

  force_reverse_video_cursor = false,  -- 让鼠标不变样式
  default_cursor_style = "BlinkingBar", -- 让鼠标指针不变形

  -- 双击 Esc 关闭功能
  keys = enable_escape_double_click_to_quit and {
    {
      key = "Escape",
      mods = "",
      action = wezterm.action_callback(double_click_esc_to_quit),
    },
  } or {},

}
