"----------------------------------------------------------------------
"* 共通設定
"----------------------------------------------------------------------
" ファイル読み込み時のエンコーディング設定
set encoding=utf-8
" vim script内でマルチバイト文字を使う場合の設定
scriptencoding utf-8
" 保存時のエンコーディング設定
set fileencoding=utf-8
"vi互換モードオフ（設定しなくてもvi互換にはなっていなかったが、明示的に書いておく）
set nocompatible
"show line number
set number
" インデント自動判別
set smartindent
" vimが自動で生成するtab文字の幅をspace 4つ分に設定する。
set shiftwidth=4
"highlight search results
set hlsearch
"map <Esc><Esc> remove highlights
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"if search characters are small, they are case insensitive.
set ignorecase
"if search characters include capital letters, they are case sensitive.
set smartcase
"highlight the current line
set cursorline
"highlight the current column
set cursorcolumn
"show editing filename
set title
" タブ等の不可視文字の可視化
set list
set listchars=tab:>.,trail:_,eol:↩︎,extends:≫,precedes:≪,nbsp:%
" 全角スペースの背景を白に変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/
" homebrewからインストールしたvimに変えたらbackspaceがきかなくなったのでこの設定を追加
set backspace=indent,eol,start
" コピペの保存行数を増やす
set viminfo='20,\"1000

" esc keymapping
noremap <C-j> <esc>
noremap! <C-j> <esc>

" for training 
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"----------------------------------------------------------------------
"* plugin setting
"----------------------------------------------------------------------

" vim-plugの設定
call plug#begin('~/.vim/plugged')
    Plug 'tomasr/molokai', {'do': 'cp colors/* ~/.vim/colors/'} "color scheme
    Plug 'scrooloose/nerdtree' "ディレクトリをTree表示
    Plug 'Yggdroot/indentLine' "インデントを可視化
    Plug 'Shougo/neocomplete.vim' "強力なコード補間機能
    ""for Markdown
    Plug 'plasticboy/vim-markdown' "Markdown用プラグイン
    Plug 'kannokanno/previm' "Markdownファイルをプレビューできるようにする
    Plug 'tyru/open-browser.vim' "Markdownファイルのプレビューをブラウザで行う
    ""for HTML
call plug#end()

"--- for molokai ---
syntax on
colorscheme molokai
set t_Co=256
"---------------------
"--- for NERDTree ---
""隠しファイルをデフォルトで表示
let NERDTreeShowHidden = 1 
""デフォルトでツリー表示
"autocmd VimEnter * execute 'NERDTree'
"--------------------

"--- for Markdown -----------------------------
"".mkd, .mdファイルも.markdownファイルと認識させる
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
"" Ctrl + p でプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>
""勝手にmarkdown構文解釈して折りたたむのを防ぐ
let g:vim_markdown_folding_disabled=1

"-----------------------------------------------

"--- for neocomplete ---
" Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 2文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 2
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 20
" preview windowを閉じない
let g:neocomplete#enable_auto_close_preview = 0
" バックスペースで補完のポップアップを閉じる
"inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"
