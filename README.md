# DotFiles

个人常用工具的配置文件集合，包括 Neovim、Kitty、WezTerm、Starship、ZSH、Yazi、Maven、Karabiner、Tmux 等。

## 一键安装

使用以下命令一键安装所有配置：

```bash
git clone https://github.com/RigerWu/DotFiles.git
cd DotFiles
./install.sh
```

安装脚本会自动备份原有配置，并将配置文件复制到对应位置。

## 手动安装

如果你只想安装部分配置，可以手动复制文件：

```bash
# 克隆仓库
git clone https://github.com/RigerWu/DotFiles.git ~/DotFiles

# 安装 Neovim 配置
mv ~/.config/nvim ~/.config/nvim.bak  # 备份原有配置
cp -r ~/DotFiles/nvim ~/.config/nvim

# 安装其他配置
cp -r ~/DotFiles/kitty ~/.config/kitty
cp -r ~/DotFiles/wezterm ~/.config/wezterm
cp -f ~/DotFiles/starship/starship.toml ~/.config/starship.toml
# ... 根据需要安装其他配置
```

## 配置说明

- **nvim**: Neovim 配置
- **kitty**: Kitty 终端配置
- **wezterm**: WezTerm 终端配置
- **starship**: Starship 提示符配置
- **zsh**: ZSH 配置
- **yazi**: Yazi 文件管理器配置
- **maven**: Maven 配置
- **karabiner**: Karabiner-Elements 键盘映射配置
- **tmux**: Tmux 配置
- **alfred**: Alfred 工作流和主题
- **idea**: IntelliJ IDEA 配置

## 注意事项

- Alfred 和 IDEA 配置需要在对应软件中手动导入
- 安装脚本会自动备份原有配置到 `~/.config_backup_时间戳` 目录
