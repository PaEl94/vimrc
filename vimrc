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
set cursorline

""" Editor behaviour
set ts=4
set scrolloff=10
set wildignore=.bak,.pyc,.o,.ojb,.a,.pdf,.jpg,.gif,.png,.avi,.mkv,.so
set hidden
set history=1000


""" Gvim
set guioptions=-m "Remove menu bar
set guioptions=-T "Remove tool bar
set guioptions=-r "Remove scroll bar

""" filetype specific settings
filetype plugin indent on
autocmd Filetype java setlocal makeprg=javac\ % "Further options on same line
autocmd Filetype c setlocal makeprg=gcc\ %\ -o\ %:r
autocmd Filetype hs set makeprg=ghc\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#


""" Key maps
map <F9> :make<Return>:copen<Return>
