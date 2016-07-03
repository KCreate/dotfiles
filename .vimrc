" Set the shell
set shell=/bin/bash

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
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'mxw/vim-jsx'
Plugin 'henrik/vim-reveal-in-finder'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

" map control-f to reveal in finder
map <c-f> :Reveal<CR>

" Encoding
set encoding=utf-8

" Force *.md files to be recognized as markdown
au BufNewFile, BufReadPost *.md set filetype=markdown

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

" vim-jsx config
let g:jsx_ext_required = 0 "Allow JSX in normal JS files"

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
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2 " never show buffers"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" switch to next buffer via gt
map <c-l> :bnext<CR>
map <c-h> :bprevious<CR>

" remap wq to save and close buffer
cnoreabbrev wq w<bar>bd
cnoreabbrev bx up<bar>bd

" Vim tabs styling
hi TabLineFill  ctermfg=lightgreen  ctermbg=darkgreen
hi TabLine      ctermfg=blue        ctermbg=yellow
hi TabLineSel   ctermfg=Red         ctermbg=Yellow
hi Title        ctermfg=lightblue   ctermbg=magenta

" bind Control-t to run "npm test"
map <C-t> :VimuxRunCommand("npm test")<CR>

" ctrlp config
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = '\v[\/](node_modules|.git)$'

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" Enable relative line numbers
set relativenumber
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
colorscheme onedark
syntax on

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
