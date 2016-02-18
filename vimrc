""" Vundle
call system("mkdir -p $HOME/.vim/{plugin,undo}")
if !filereadable($HOME . "/.vimrc.plugins") | call system("touch $HOME/.vimrc.plugins") | endif
if !filereadable($HOME . "/.vimrc.first") | call system("touch $HOME/.vimrc.first") | endif
if !filereadable($HOME . "/.vimrc.last") | call system("touch $HOME/.vimrc.last") | endif

let has_vundle=1
if !filereadable($HOME."/.vim/bundle/Vundle.vim/README.md")
	echo "Installing Vundle..."
	echo ""
	silent !mkdir -p $HOME/.vim/bundle
	silent !git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
	let has_vundle=0
endif
filetype off                                " required to init
set rtp+=$HOME/.vim/bundle/Vundle.vim       " include vundle
call vundle#begin()                         " init vundle

Plugin 'gmarik/Vundle.vim'

" Local plugins (and only plugins in this file!) 
if filereadable($HOME."/.vimrc.plugins")
	source $HOME/.vimrc.plugins
endif

Plugin 'chrisbra/SudoEdit.vim'
Plugin 'ervandew/supertab'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'itchyny/lightline.vim'

call vundle#end()

" Installing plugins the first time
if has_vundle == 0
	echo "Installing Plugins, please ignore key map error messages"
	echo ""
	:PluginInstall
endif

""" Interface
set number
set t_Co=256
syntax on
colorscheme jellybeans
let g:lightline = { 'colorscheme': 'jellybeans',}
set cursorline
set noshowmode 
" Always show statusline
set laststatus=2

""" Editor behaviour
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=10
set wildignore=.bak,.pyc,.o,.ojb,.a,.pdf,.jpg,.gif,.png,.avi,.mkv,.so
set hidden
set history=1000
set wildmode=longest,list
set incsearch
set ignorecase
set smartcase

""" Gvim
set guioptions=-m "Remove menu bar
set guioptions=-T "Remove tool bar
set guioptions=-r "Remove scroll bar
set mouse=

""" filetype specific settings
filetype plugin indent on
autocmd Filetype java setlocal makeprg=javac\ % 
autocmd filetype java map <F10> :!java %:r<CR>
autocmd Filetype c setlocal makeprg=gcc\ %\ -o\ %:r
autocmd Filetype hs setlocal makeprg=ghc\ %
autocmd Filetype tex setlocal makeprg=pdflatex\ %
autocmd Filetype tex map <F10> :!evince %:r.pdf<CR> 

set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

""" Key maps
map <F9> :make<Return>:copen<Return>
"Don't skip wrapped lines
nmap j gj 
nmap k gk
:cnoremap <C-a>  <Home>
:cnoremap <C-d>  <Delete>
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>
nnoremap <F5> :GundoToggle<CR>
