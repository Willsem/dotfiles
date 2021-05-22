#!/bin/sh

rm -rf ~/.config/nvim
rm -rf ~/.config/alacritty
rm -rf ~/.config/kitty
rm -rf ~/.emacs.d
rm -rf ~/.yabairc
rm -rf ~/.skhdrc
rm -rf ~/.zshrc

cp -rf ./.config/nvim ~/.config/nvim
cp -rf ./.config/alacritty ~/.config/alacritty
cp -rf ./.config/kitty ~/.config/kitty
cp -rf ./.emacs.d ~/.emacs.d
cp -rf ./.yabairc ~/.yabairc
cp -rf ./.skhdrc ~/.skhdrc
cp -rf ./.zshrc ~/.zshrc
