" Setup Vundle
set nocompatible
filetype off

" Default Mac OSX Clipboard
set clipboard=unnamed

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-css-color'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'valloric/matchtagalways'
Plugin 'tpope/vim-surround'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'benmills/vimux'
Plugin 'moll/vim-node'
Plugin 'mkitt/tabline.vim'

call vundle#end()
filetype plugin indent on

" Glyphs
set encoding=utf-8

" vim-devicons config
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIcons_conceal_nerdtree_brackets = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='kolor'
let g:airline#extensions#tabline#enabled = 1

" Vim tabs styling
hi TabLineFill  ctermfg=lightgreen  ctermbg=darkgreen
hi TabLine      ctermfg=blue        ctermbg=yellow
hi TabLineSel   ctermfg=Red         ctermbg=Yellow
hi Title        ctermfg=lightblue   ctermbg=magenta

" ctrlp config
let g:ctrlp_show_hidden = 1

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" Enable relative line numbers
set relativenumber
set number

map <C-n> :NERDTreeToggle<CR>

" Show hidden files inside nerdtree
let NERDTreeShowHidden=1

set laststatus=2
set t_Co=256
let g:miniBufExplForceSyntaxEnable = 1

" Make backspace work over lines
set backspace=2

" Remove the escape key delay
set notimeout ttimeout ttimeoutlen=0

" Set the color scheme
colorscheme onedark
syntax on

" Line number coloring
highlight LineNr ctermfg=white term=bold
highlight CursorLineNR ctermfg=220

" Use the vertical box drawing character for split panes
set fillchars=vert:│

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

" Associate *.handlebars and *.hb with html files
au BufRead,BufNewFile *.handlebars setfiletype html
au BufRead,BufNewFile *.hbs setfiletype html
