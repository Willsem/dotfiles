#!/bin/bash

pwd="$(pwd)"

# setup neovim
ln -s $pwd/nvim ~/.config

# setup window manager
ln -s $pwd/window_manager/sketchybar ~/.config
ln -s $pwd/window_manager/.yabairc ~
ln -s $pwd/window_manager/.skhdrc ~

# setup terminal
ln -s $pwd/terminal/.zshrc ~
ln -s $pwd/terminal/starship.toml ~/.config
ln -s $pwd/terminal/.tmux.conf ~
ln -s $pwd/terminal/.wezterm.lua ~
