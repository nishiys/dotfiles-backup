# dotfilesのGit管理(macOS) {2018/10/20更新}

macOS用をmasterブランチで管理。
Ubuntu用にubuntuブランチを作成。


` $git add .` (全ファイルaddする場合)  
` $git commit -m "ここにコメント"`  
` $git push`  

## install.sh
./install.sh

$HOME直下に.で始まるファイル・ディレクトリのシンボリックリンクを作成。

実行可能権限付いてないとシェルスクリプトは動かないので、  
`chmod +x install.sh`  
で実行権限(x)を追加(+)して実行した。

注) WINDOWSではシンボリックリンクのコマンドがこれと違ったと思うので使えない。

## homebrew.sh
homebrewのインストールから最低限必要なもののインストールを自動で行うscript

注) ricty (Regular) のみ
```
$ cp -f /usr/local/Cellar/ricty/3.2.4（バージョン要確認）/share/fonts/Ricty*.ttf ~/Library/Fonts/
$ fc-cache -vf
```
を手動で実行する必要あり。


## zsh
.zshには.zshrc本体以外のファイル（分割ファイルなど）を入れ、ホームディレクトリには

- zshrc
- .zshrc.zwc
- .zsh/

の三つがzsh設定ファイルとして存在するように設計。

## vim
- .vim/
- .vimrc

の二つがvim設定ファイルとして存在するように設計。

### .vim/
- colors/ : カラースキームの保管場所
- plugged/ : vim-plugでインストールしたものはここに
- autoload/ : vim-plug本体の置き場

以上3ディレクトリ構成。

### .vimrc
#### プラグイン管理
**vim-plug**で行なっている。
新たにプラグインを導入したい場合は、.vimrcのvim-plugの記述のところで
call plug#begin()とcall plug#end()の間に使いたいプラグインを羅列するだけ。

.vimrcの更新は
`$source .vimrc`
じゃないので注意。普通に再度vimを開くか、`:source .vimrc`とすればよい。

その後、vimを開いた状態で`:PlugInstall`を実行すればGithubから.vim/pluged/にプラグインをインストールしてくれる。

### Markdown用プラグイン導入 (2018/06/14)
vimをmarkdown用のエディタとして使いたかったので、markdown用のプラグインを三つ入れた。  
.md .mkd .markdownのいずれかで保存されたファイルをvimで編集中に
`:PrevimOpen` --> Ctrl+p にkey-mapping

を実行すると、ブラウザ上でプレビューできるようにした。  
それ以降は保存するたびにブラウザ上でもリアルタイムで更新される。



