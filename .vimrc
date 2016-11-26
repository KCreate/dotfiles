" Set the shell
set shell=/bin/bash

" Setup Vundle
set nocompatible
filetype off

" Default Mac OSX Clipboard
set clipboard=unnamed

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mkitt/tabline.vim'
Plugin 'morhetz/gruvbox'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/matchtagalways'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'VundleVim/Vundle.vim'
Plugin 'rhysd/vim-crystal'
Plugin 'kballard/vim-swift'

call vundle#end()
filetype plugin indent on

" Reduce the updatetime
set updatetime=250

" Navigate between wrapped lines
noremap <silent> <Up> gk
noremap <silent> <Down> gj
noremap <silent> k gk
noremap <silent> j gj

" Encoding
set encoding=utf-8

" Guifont
set guifont=Fira\ Mono\ Medium\ for\ Powerline

" Markdown fence code highlighting
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'css', 'scss']

" syntastic config
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_stl_format = ''
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='kolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2 " never show buffers"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" switch to next buffer via gt
map <c-l> :bnext<CR>
map <c-h> :bprevious<CR>

" Vim tabs styling
hi TabLineFill  ctermfg=lightgreen  ctermbg=darkgreen
hi TabLine      ctermfg=blue        ctermbg=yellow
hi TabLineSel   ctermfg=Red         ctermbg=Yellow
hi Title        ctermfg=lightblue   ctermbg=magenta

" ctrlp config
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = '\v[\/](node_modules|.git)$'

" Enable relative line numbers
set number

" open nerdtree via Control n
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
set background=dark
colorscheme gruvbox
syntax on

" Gruvbox config
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1

" Line number coloring
highlight LineNr ctermfg=white term=bold
highlight CursorLineNR ctermfg=220

" syntastic error styling
hi SpellBad ctermfg=white ctermbg=grey
hi SpellCap ctermfg=white ctermbg=grey

" Use the vertical box drawing character for split panes
set fillchars=vert:│

" command autocompletion
set wildmenu

" enable the mouse
set mouse=a

" remap tab to 4 spaces
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

set shiftround
set showbreak=…
set ttyfast
set autoindent
set smartindent

" Hide the default vim statusbar
set noshowmode

au BufRead, BufNewFile      *.charly        setfiletype javascript
au BufNewFile, BufReadPost  *.md            setfiletype markdown

" Automatically remove whitespace on file write
autocmd BufWritePre * %s/\s\+$//e

" Indent with 2 spaces in ruby or crystal files
autocmd FileType crystal setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType charly setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
