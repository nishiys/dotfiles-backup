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
"----------------------------------------------------------------------
"* plugin setting
"----------------------------------------------------------------------

" vim-plugの設定
call plug#begin('~/.vim/plugged')
    Plug 'tomasr/molokai'
call plug#end()

"--- for molokai ---
syntax on
colorscheme molokai
set t_Co=256
"---------------------



