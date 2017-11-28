"vi互換モードオフ（設定しなくてもvi互換にはなっていなかったが、明示的に書いておく）
set nocompatible
"show line number
set number
"set >> and << indent as 4 spaces
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

"--- color setting ---
syntax on
colorscheme molokai
set t_Co=256
"---------------------



