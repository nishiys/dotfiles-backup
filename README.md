# dotfilesのGit管理
自分専用dotfilesを複数環境で共有するため、またバックアップとして、dotfilesという名前のフォルダでGit管理する。


## setlink.sh
setlink.shというシェルスクリプトを実行すると、DOT_FILES=()のカッコ内に書かれたドットファイルのシンボリックリンクをホームディレクトリ直下に作成する。
注) WINDOWSではシンボリックリンクのコマンドがこれと違ったと思うので使えない。

シンボリックリンクは、NERDTreeの画面で確認できるよ

## 備考

