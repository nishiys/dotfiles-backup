
# ****************************************************************
# 環境変数
# ****************************************************************

### PATHの設定

#fundamental path
export PATH="/usr/local/bin"
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin
export PATH=$PATH:$HOME/usr/bin #どこかからダウンロードしてソースからビルドしたものはここで管理


# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#TeX
export PATH="$PATH:/usr/local/texlive/2017/bin/x86_64-darwin"


#git (Homebrew)
export PATH="$PATH:/usr/local/Cellar/git/2.14.3/bin/"

### PATH以外の環境変数の設定

#言語設定
export LANG=ja_JP.UTF-8
#utcart iranai?
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib
#Gnuplot
export GNUTERM=x11







# ****************************************************************
# Zplug
# ****************************************************************

# brewのインストールパスを設定する
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# pluginの追加

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2


## 未インストール項目をインストールする
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
       echo; zplug install
  fi
fi
## コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose


# ****************************************************************
# Zsh setting
# ****************************************************************

###########################
## プロンプトの設定
# 色を使用できるようにする
autoload -Uz colors
colors

# 左プロンプト
if [ $UID -eq 0 ];then
# ルートユーザーの場合
PROMPT="
%F{red}%n:%f%F{green}%d%f [%m] %%"
else
# ルートユーザー以外の場合
PROMPT="
%{$fg[blue]%}%n@%m:%{$reset_color%} %{$fg[red]%}%~%{$reset_color%}
%{$fg[blue]%}$%{$reset_color%} "

fi
export LSCOLORS=cxfxexdxbxegedabagacad

#右プロンプト (参考 http://tkengo.github.io/blog/2013/05/12/zsh-vcs-info/)
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'


###########################
## ヒストリの設定
# .zsh_history(コマンド履歴を保存するファイル)~/だけに置かれるように。
HISTFILE=~/.zsh_history
# メモリに保存するコマンド数(HISTSIZE)とファイルに保存するコマンド数(SAVESIZE)
HISTSIZE=500000
SAVEHIST=1000000

# 直前のコマンドの重複を削除
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

###########################
## 補完
# 補完機能を有効にする
autoload -Uz compinit 
# 補完候補を一覧を表示
setopt auto_list
# タブ補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
compinit
# 補完メニューをカーソルで選択可能にする
zstyle ':completion:*:default' menu select=1


###########################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit


###########################
## エイリアス

alias rm='rm -i' #-fつけると消すかどうか聞かずに削除してくれる。

alias ll="ls -l" #ファイル情報表示
alias la="ls -a" #dotfileも表示

alias mkdir="mkdir -p -v" #(--parents)親子ディレクトリを同時に作成可能, (--verbose)結果を表示

alias mpiexec="export TMPDIR='/tmp'; mpiexec" #macでは自動で$TMPDIRが決められ、そこに一時ファイルが保存される仕様になっているが、或る日突然$TMPDIRが長すぎるということでmpiexecが通らなくなったのでこのエイリアスを設定した。




########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F' #lsに色をつける(-G),ディレクトリに/をつける(-F)
	# source-highlightでlessに色付け
	export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
	alias less='less -R'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac


########################################
# .zshrcを更新後コンパイルする
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi












