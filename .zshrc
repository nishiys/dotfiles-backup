
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

# zplugをzplugで管理
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# Zshの候補選択を拡張
zplug "zsh-users/zsh-completions"
# 入力途中に候補をうっすら表示
zplug "zsh-users/zsh-autosuggestions"
# コマンドを種類ごとに色付け
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# ヒストリの補完を強化する
zplug "zsh-users/zsh-history-substring-search", defer:3



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


#autoload vcs_info
#zstyle ":vcs_info:*" enable git
#zstyle ":vcs_info:git:*" check-for-changes true
#zstyle ":vcs_info:git:*" formats "⭠ %r ⮁ %b%u%c"
#zstyle ":vcs_info:git:*" actionformats "⭠ %r ⮁ %b%u%c ⮁ %a"
#zstyle ":vcs_info:git:*" unstagedstr " ⮁ Unstaged"
#zstyle ":vcs_info:git:*" stagedstr " ⮁ Staged"
#
#git_is_track_branch(){
#    if [ "$(git remote 2>/dev/null)" != "" ]; then
#        local target_tracking_branch="origin/$(git rev-parse --abbrev-ref HEAD)"
#        for tracking_branch in $(git branch -ar) ; do
#            if [ "$target_tracking_branch" = "$tracking_branch" ]; then
#                echo "true"
#            fi
#        done
#    fi
#}
#
#git_info_pull(){
#    if [ -n "$(git_is_track_branch)" ]; then
#        local current_branch="$(git rev-parse --abbrev-ref HEAD)"
#        local head_rev="$(git rev-parse HEAD)"
#        local origin_rev="$(git rev-parse origin/$current_branch)"
#        if [ "$head_rev" != "$origin_rev" ] && [ "$(git_info_push)" = "" ]; then
#                echo " ⮁ Can Be Pulled"
#        fi
#    fi
#}
#
#git_info_push(){
#    if [ -n "$(git_is_track_branch)" ]; then
#        local current_branch="$(git rev-parse --abbrev-ref HEAD)"
#        local push_count=$(git rev-list origin/"$current_branch".."$current_branch" 2>/dev/null | wc -l)
#        if [ "$push_count" -gt 0 ]; then
#            echo " ⮁ Can Be Pushed($push_count)"
#        fi
#    fi
#}
#
#function update_git_info() {
#    LANG=en_US.UTF-8 vcs_info
#    _vcs_info=$vcs_info_msg_0_
#    _git_info_push=$(git_info_push)
#    _git_info_pull=$(git_info_pull)
#    if [ -n "$_vcs_info" ]; then
#        local BG_COLOR=green
#
#        if [ -n "$_git_info_push" ] || [ -n "$_git_info_pull" ]; then
#          BG_COLOR=yellow
#          FG_COLOR=black
#        fi
#
#        if [[ -n `echo $_vcs_info | grep -Ei "merge|unstaged|staged" 2> /dev/null` ]]; then
#            BG_COLOR=red
#            FG_COLOR=white
#        fi
#        echo "%{%K{$BG_COLOR}%}⮀%{%F{$FG_COLOR}%} $_vcs_info$_git_info_push$_git_info_pull %{%F{$BG_COLOR}%K{magenta}%}⮀"
#    else
#       echo "%{%K{magenta}%}⮀"
#    fi
#}
#
#
#
#
#
##   %{%B%}...%{%b%}: 「...」を太字にする。
##   %K{red}...%{%k%}: 「...」を赤の背景色にする。
##   %{%F{cyan}%}...%{%f%}: 「...」をシアン色の文字にする。
##   %n: ユーザ名
##   %?: 最後に実行したコマンドの終了ステータス
##   %(x.true-text.false-text): xが真のときはtrue-textになり
##                              偽のときはfalse-textになる。
#PROMPT_HOST="%{%b%F{gray}%K{blue}%} %(?.%{%F{green}%}✔.%{%F{red}%}✘)%{%F{black}%} %n %{%F{blue}%}"
#PROMPT_DIR="%{%F{black}%} %~%  "
#PROMPT_SU="%(!.%{%k%F{blue}%K{black}%}⮀%{%F{yellow}%} ⚡ %{%k%F{black}%}.%{%k%F{magenta}%})⮀%{%f%k%b%}"
#PROMPT="
#%{%f%b%k%}$PROMPT_HOST$(update_git_info)$PROMPT_DIR$PROMPT_SU
#%{%f%b%K{blue}%} %{%F{black}%}$ %{%k%F{blue}⮀%{%f%k%b%} "
#SPROMPT="${WHITE}%r is correct? [n,y,a,e]: %{$reset_color%}"
#
#












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
# 入力ミス時に似たコマンドを表示
setopt correct


###########################
## powerline
# powerline-daemonの常駐
#powerline-daemon -q
# pip show powerline-statusの結果のLocationの項がpipのインストール先
#piploc=$HOME/.pyenv/versions/3.6.5/lib/python3.6/site-packages
# zshにpowerlineの適用
#. $piploc/powerline/bindings/zsh/powerline.zsh





###########################
## pip
# pip zsh 補完の有効化
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

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











