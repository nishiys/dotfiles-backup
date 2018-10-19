#!/bin/bash


# -eはエラー時にスクリプトが停止、-uは未定義変数利用時にスクリプトが停止
set -eu

# terminal colorscheme setting
git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh


# Install powerline fonts
# install.shはOSの判定を自動で行ってくれる
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ../
rm -rf fonts
