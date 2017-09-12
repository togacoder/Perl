syntax enable
syntax on
set number
set tabstop=4
set shiftwidth=4
set smartindent
set backspace=indent,eol,start
set hlsearch
set cursorline
set fenc=utf-8
hi Comment ctermfg=2

inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim/bundle'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/nerdtree')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
nmap <C-n> :NERDTree<CR>
"autocmd VimEnter * execute 'NERDTree'
