#!/bin/bash

# -eはエラー時にスクリプトが停止、-uは未定義変数利用時にスクリプトが停止
set -eu

# Install Ricty Diminished / Ricty Diminished for Powerline
git clone https://github.com/mzyy94/RictyDiminished-for-Powerline.git
cp -f ~/RictyDiminished-for-Powerline/Ricty*.ttf ~/Library/Fonts/
cp -f ~/RictyDiminished-for-Powerline/powerline-fontpatched/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf


# Install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

