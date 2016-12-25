"
" Operating System Settings
" Integration with system services
"
set nocompatible
set hidden
set shell=/bin/bash
set clipboard=unnamed
set encoding=utf-8
set laststatus=2
set t_Co=256
set backspace=2
set notimeout ttimeout ttimeoutlen=0
set number
set hlsearch
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=b
set guioptions-=h
set guioptions+=m

"
" Navigation and control
"
let mapleader = ","
noremap <silent> <Up> gk
noremap <silent> <Down> gj
noremap <silent> k gk
noremap <silent> j gj
noremap <c-l> :bnext<CR>
noremap <c-h> :bprevious<CR>
noremap <c-n> :NERDTreeToggle<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <buffer><silent> <C-i> :call g:far#change_exclud_under_cursor(-1)<CR>
vnoremap <buffer><silent> <C-i> :call g:far#change_exclud_under_cursor(-1)<CR>

"
" Vundle Setup
"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'VundleVim/Vundle.vim'
Plugin 'rhysd/vim-crystal'
Plugin 'morhetz/gruvbox'
Plugin 'brooth/far.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

set wildmenu
set mouse=a
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set shiftround
set showbreak=…
set ttyfast
set autoindent
set smartindent
set noshowmode " Hides the default vim status bar

"
" Far.vim config
"
let g:far#auto_preview=1
let g:far#highlight_match=1
let g:far#default_mappings=1
nnoremap <silent> <C-f> :Farp<CR>

"
" NerdTree Settings
"
let NERDTreeShowHidden=1

"
" Misc. settings
"
set updatetime=500

"
" Aesthetic settings
"
set guifont=Menlo
syntax enable
set background=dark
colorscheme gruvbox

let g:solarized_termcolors=16

"
" Vim-Airline config options
"
let g:airline_left_sep=""
let g:airline_right_sep=""
let g:airline_theme='cool'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_min_count=2
let g:airline#extensions#tabline#buffer_min_count=2
let g:airline#extensions#tabline#fnamemod=":t"
let g:airline_section_b='' " Hides git info
let g:airline_section_y='' " Hides file encoding
let g:airline_section_z='' " Hides line number, column number etc.

"
" Vim Tabs styling
"
highlight TabLineFill ctermfg=lightgreen  ctermbg=darkgreen
highlight TabLine     ctermfg=blue        ctermbg=yellow
highlight TabLineSel  ctermfg=red         ctermbg=yellow
highlight Title       ctermfg=lightblue   ctermbg=magenta

"
" CTRLP config
"
let g:ctrlp_show_hidden=1
let g:ctrlp_use_caching=0
let g:ctrlp_custom_ignore='\v[\/](node_modules|.git|.shards)$'

highlight LineNr ctermfg=white term=bold
highlight CursorLineNR ctermfg=21

"
" Filetypes
"
au BufNewFile,BufReadPost *.md set filetype=markdown
au BufNewFile,BufReadPost *.ch set filetype=javascript
au BufWritePre * %s/\s\+$//e " Remove whitespace on file write

"
" Highlight lines longer than 100 columns with a red background
"
highlight OverLength ctermbg=red ctermfg=white guifg=white guibg=#FF5C57
match OverLength /\%121v.\+/
