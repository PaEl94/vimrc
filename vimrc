""" Vundle
call system("mkdir -p $HOME/.vim/{plugin,undo}")
"if !filereadable($HOME . "/.vimrc.plugins") | call system("touch $HOME/.vimrc.plugins") | endif
"if !filereadable($HOME . "/.vimrc.first") | call system("touch $HOME/.vimrc.first") | endif
"if !filereadable($HOME . "/.vimrc.last") | call system("touch $HOME/.vimrc.last") | endif

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
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/matchit'
Plugin 'leafgarland/typescript-vim'
Plugin 'chazy/cscope_maps'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'Rip-Rip/clang_complete'


call vundle#end()

" Installing plugins the first time
if has_vundle == 0
	echo "Installing Plugins, please ignore key map error messages"
	echo ""
	:PluginInstall
endif

""" Interface
set number
set relativenumber
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
" remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""" Gvim
set guioptions-=m "Remove menu bar
set guioptions-=T "Remove tool bar
set guioptions-=r "Remove scroll bar
set mouse=

""" files
set noswapfile

""" filetype specific settings
filetype plugin indent on
autocmd Filetype java setlocal makeprg=javac\ % 
autocmd filetype java map <F10> :!java %:r<CR>
autocmd filetype java map <Leader>t :ProjectTreeToggle <CR>
autocmd Filetype c setlocal makeprg=gcc\ %\ -ansi\ -pedantic\ -Wall\ -o\ %:r
autocmd filetype c map <F10> :!./%:r<CR>
autocmd Filetype cpp setlocal makeprg=clang++\ -g\ -Wall\ -std=c++17\ %\ -o\ %:r
autocmd filetype cpp map <F10> :!./%:r<CR>
autocmd Filetype hs setlocal makeprg=ghc\ %
autocmd Filetype tex setlocal makeprg=pdflatex\ %
autocmd Filetype tex map <F10> :!evince %:r.pdf<CR> 
autocmd Filetype tex let @1='i\(\)hi'
autocmd Filetype tex let @2='i\[\]hi'
au BufNewFile,BufRead *.psql setf psql

""" Key maps
map <F9> :make<Return>:copen<Return>
"Move by column instead of line
map <expr> k (v:count == 0 ? 'gk' : 'k')
map <expr> j (v:count == 0 ? 'gj' : 'j')
map <C-a> ^
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :SudoWrite<CR>
nnoremap <Leader>' :%s/"u/ü/gIe \| %s/"o/ö/gIe \| %s/"a/ä/gIe \| %s/"U/Ü/gIe \| %s/"O/Ö/gIe \| %s/"A/Ä/gIe <CR>
