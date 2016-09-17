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
Plugin 'ap/vim-css-color'
Plugin 'benmills/vimux'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'henrik/vim-reveal-in-finder'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mattn/emmet-vim'
Plugin 'mkitt/tabline.vim'
Plugin 'moll/vim-node'
Plugin 'morhetz/gruvbox'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'valloric/matchtagalways'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'VundleVim/Vundle.vim'
Plugin 'rhysd/vim-crystal'
Plugin 'kballard/vim-swift'

call vundle#end()
filetype plugin indent on

" Remap vim-multiple-cursors to C-d like in sublime
let g:multi_cursor_next_key='<C->'

" Reduce the updatetime
set updatetime=250

" map control-f to reveal in finder
map <c-f> :Reveal<CR>

" Navigate between wrapped lines
noremap <silent> <Up> gk
noremap <silent> <Down> gj
noremap <silent> k gk
noremap <silent> j gj

" Encoding
set encoding=utf-8

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

" ctrlp config
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = '\v[\/](node_modules|.git)$'

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

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
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set shiftround
set showbreak=…
set ttyfast
set autoindent
set smartindent

" Hide the default vim statusbar
set noshowmode

au BufRead,BufNewFile *.handlebars setfiletype html
au BufRead,BufNewFile *.hbs setfiletype html
au BufNewFile, BufReadPost *.md set filetype=markdown

" Automatically remove whitespace on file write
autocmd BufWritePre * %s/\s\+$//e

" Indent with 2 spaces in ruby or crystal files
autocmd FileType crystal setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
