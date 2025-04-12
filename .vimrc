set nocompatible
filetype on
filetype plugin on
filetype indent on

syntax on
set number

set shiftwidth=4
set tabstop=4
set expandtab
set backspace=indent,eol,start

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

nmap <A-Up> :m -2<CR>
nmap <A-Down> :m +1<CR>
