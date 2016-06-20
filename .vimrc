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
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mattn/emmet-vim'
Plugin 'valloric/matchtagalways'

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
set background=dark
colorscheme onedark
syntax on

" Line number coloring
highlight LineNr ctermfg=white

set wildmenu
set showcmd
set mouse=a

set ruler

set shiftwidth=4
set softtabstop=4
set shiftround
set smarttab
set showbreak=…
set ttyfast
set autoindent
set smartindent

set expandtab
set noshowmode
