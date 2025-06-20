#!/bin/bash

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}开始安装配置文件...${NC}"

# 创建备份目录
BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo -e "${BLUE}创建备份目录: $BACKUP_DIR${NC}"

# 配置目录列表
CONFIG_DIRS=(
  "nvim"
  "kitty"
  "wezterm"
  "starship"
  "zsh"
  "yazi"
  "maven"
  "karabiner"
  "tmux"
)

# 安装配置文件
for dir in "${CONFIG_DIRS[@]}"; do
  if [ -d "$HOME/.config/$dir" ]; then
    echo -e "${BLUE}备份已存在的 $dir 配置...${NC}"
    mv "$HOME/.config/$dir" "$BACKUP_DIR/$dir"
  fi
  
  if [ -d "$PWD/$dir" ]; then
    echo -e "${GREEN}安装 $dir 配置...${NC}"
    mkdir -p "$HOME/.config"
    cp -r "$PWD/$dir" "$HOME/.config/"
  fi
done

# 处理特殊配置
if [ -d "$PWD/alfred" ]; then
  echo -e "${GREEN}安装 Alfred 配置...${NC}"
  # Alfred 配置可能需要特殊处理，具体位置可能需要调整
  echo -e "${BLUE}Alfred 配置需要手动导入，请在 Alfred 偏好设置中导入配置文件${NC}"
fi

if [ -d "$PWD/idea" ]; then
  echo -e "${GREEN}安装 IntelliJ IDEA 配置...${NC}"
  echo -e "${BLUE}IDEA 配置需要手动导入，请在 IDEA 中导入配置文件${NC}"
fi

# 安装 starship 配置
if [ -d "$PWD/starship" ]; then
  echo -e "${GREEN}安装 Starship 配置...${NC}"
  mkdir -p "$HOME/.config"
  cp -f "$PWD/starship/starship.toml" "$HOME/.config/starship.toml"
fi

# 安装 zsh 配置
if [ -f "$PWD/zsh/.zshrc" ]; then
  echo -e "${GREEN}安装 Zsh 配置...${NC}"
  if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$BACKUP_DIR/.zshrc"
  fi
  cp -f "$PWD/zsh/.zshrc" "$HOME/.zshrc"
fi

echo -e "${GREEN}配置文件安装完成!${NC}"
echo -e "${BLUE}原有配置已备份至: $BACKUP_DIR${NC}"
echo -e "${BLUE}如需恢复原有配置，请运行: cp -r $BACKUP_DIR/* ~/.config/${NC}" 