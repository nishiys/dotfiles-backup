# dotfilesのGit管理
自分専用dotfilesを複数環境で共有するため、またバックアップとして、dotfilesという名前のフォルダでGit管理する。

` $git add .` (全ファイルaddする場合)  
` $git commit -m "ここにコメント"`  
` $git push`  

同期する場合は  
`$git pull`  
すればよい。

## setlink.sh
setlink.shというシェルスクリプトを実行すると、DOT_FILES=()のカッコ内に書かれたドットファイルのシンボリックリンクをホームディレクトリ直下に作成する。  
実行可能権限付いてないとシェルスクリプトは動かないので、  
`chmod +x setlink.sh`  
で実行権限(x)を追加(+)して実行した。

注) WINDOWSではシンボリックリンクのコマンドがこれと違ったと思うので使えない。

シンボリックリンクは、NERDTreeの画面で確認できるよ

## .vimrc
### プラグイン管理
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
`:PrevimOpen`
を実行すると、ブラウザ上でプレビューできるようにした。  
それ以降は保存するたびにブラウザ上でもリアルタイムで更新される。



