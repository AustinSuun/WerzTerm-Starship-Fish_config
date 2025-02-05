# WezTerm-Starship-Fish_config
My own terminal and shell configuration.Use WezTerm+Starship+Fish


[English README](README_en.md)|[中文 README](README.md)


![20250205135853](https://raw.githubusercontent.com/AustinSuun/image/main/img/20250205135853.png)

## 介绍
这是我自己的终端和shell配置，使用了
[WezTerm](https://github.com/wez/wezterm) +
[Starship](https://github.com/starship/starship) +
[Fish Shell](https://github.com/fish-shell/fish-shell)
点击链接可以开始安装
starship 主题使用了  [gruvbox-rainbow](https://starship.rs/zh-CN/presets/gruvbox-rainbow)
，并且增加了电量显示

WerzTerm 使用 `Hack Nerd Font` 字体，增加了一些颜色配置，去除了标题栏，并且可以使用快捷键 `Esc+ Esc`快速关闭终端

## 怎么使用|Linux 为例
安装完软件之后，把配置文件放到对应的目录下

- WerzTerm: `/home/用户名/.config/wezterm/wezterm.lua`

- Starship: `/home/用户名/.config/starship.toml`

- Fish: `/home/用户名/.config/fish/config.fish`

其他系统参考安装链接中的介绍，放置配置文件

__需要安装字体__
使用字体 'Hack Nerd Font'，[nerd Font](https://www.nerdfonts.com/font-downloads)下载地址
或者Linux 工具安装,例如 `yay`

```shell
yay -S ttf-hack-nerd-fonts
```
