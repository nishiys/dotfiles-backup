#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."


brew upgrade --all


formulas=(
    "vim --with-lua"
    zsh
    zplug
    zsh-completions
    pyenv
    git
    tig
    coreutils
    gnu-sed
    grep
    gawk
    gnu-tar
    tmux
    wget
    curl
    tree
    cask
    "ricty --vim-powerline --powerline" # 別途fontを移す作業が必要
    # https://dev.classmethod.jp/devenv/vim-ricty-for-powerline/ を参考に
)


"brew tap..."
brew tap sanemat/font


echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    iterm2
    mactex
    java
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done




brew cleanup
brew cask cleanup



cat << END


**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
