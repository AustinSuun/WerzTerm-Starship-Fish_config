# WezTerm-Starship-Fish_config
My own terminal and shell configuration.Use WezTerm+Starship+Fish


[English README](README_en.md)|[中文 README](README.md)


![20250205135853](https://raw.githubusercontent.com/AustinSuun/image/main/img/20250205135853.png)

## introduce
This is my own terminal and shell configuration.[WezTerm](https://github.com/wez/wezterm) +
[Starship](https://github.com/fish-shell/fish-shell) +
[Fish Shell](https://github.com/starship/starship).
Click the link to start installation

Starship theme use  [gruvbox-rainbow](https://starship.rs/zh-CN/presets/gruvbox-rainbow)
，And increase the power display

WerzTerm use `Hack Nerd Font` , some color configuration has been added, the title bar has been removed, and the terminal can be quickly closed using the shortcut key `Esc+Esc`

## How to use | Linux as an example
After installing the software, put the configuration file in the corresponding directory

- WerzTerm: `/home/username/.config/wezterm/wezterm.lua`

- Starship: `/home/username/.config/starship.toml`

- Fish: `/home/username/.config/fish/config.fish`  PS: Just add starship init fish |at the end of the file source

For other systems refer to the introduction in the installation link, place the configuration file

__Need to install fonts__
use 'Hack Nerd Font'，[nerd Font](https://www.nerdfonts.com/font-downloads)
Or installation of Linux tools, for example `yay`

```shell
yay -S ttf-hack-nerd-fonts
```
