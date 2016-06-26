" Setup Vundle
set nocompatible
filetype off

" Default Mac OSX Clipboard
set clipboard=unnamed

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-css-color'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'valloric/matchtagalways'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on

" Enable relative line numbers
set relativenumber
set number

map <C-n> :NERDTreeToggle<CR>

" Show hidden files inside nerdtree
let NERDTreeShowHidden=1

set laststatus=2
set t_Co=256
let g:miniBufExplForceSyntaxEnable = 1

set encoding=utf-8

" Make backspace work over lines
set backspace=2

" Remove the escape key delay
set notimeout ttimeout ttimeoutlen=0

" Set the color scheme
colorscheme onedark
syntax on

" Line number coloring
highlight LineNr ctermfg=white

" command autocompletion
set wildmenu

" enable the mouse
set mouse=a

" remap tab to 4 spaces
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

set shiftround
set showbreak=…
set ttyfast
set autoindent
set smartindent

" Hide the default vim statusbar
set noshowmode
