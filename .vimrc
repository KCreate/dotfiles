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
set incsearch
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
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <c-l> :bnext<CR>
nnoremap <c-h> :bprevious<CR>
nnoremap <c-n> :NERDTreeToggle<CR>
nnoremap - /

"
" Buffer management
"
nnoremap bp :bprevious<CR>
nnoremap bn :bnext<CR>
nnoremap bd :b#<bar>bd#<CR>

"
" Split management
"
nnoremap sw :split<CR>
nnoremap sd :vsplit<CR>
nnoremap sq <C-W>q
nnoremap s= <C-W>=
nnoremap sh <C-W><left>
nnoremap sj <C-W><down>
nnoremap sk <C-W><up>
nnoremap sl <C-W><right>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

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
Plugin 'brooth/far.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nanotech/jellybeans.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/vim-cursorword'
Plugin 'mhartington/oceanic-next'
Plugin 'chriskempson/base16-vim'
Plugin 'timakro/vim-searchant'
Plugin 'MaxSt/FlatColor'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'

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
set nofoldenable " Disables code folding

"
" Far.vim config
"
let g:far#auto_preview=1
let g:far#highlight_match=1
let g:far#default_mappings=1
nnoremap <silent> <C-f> :Farp<CR>

"
" Clear search highlighting
"
nnoremap <Esc> :noh<CR>
let g:searchant_map_stop = 0
nmap <Esc> <Plug>SearchantStop

"
" NerdTree Settings
"
let NERDTreeShowHidden=1

"
" Misc. settings
"
set updatetime=500

"
" Git bindings
"
nnoremap gs :!git status <CR>
nnoremap gp :!git p <CR>
nnoremap gc :!git commit <CR>
nnoremap ga :!git add %<CR>
nnoremap gr :!git reset<CR>

"
" Aesthetic settings
"
set guifont=Hack:h11
syntax enable
set background=dark
colorscheme FlatColor

"
" cursorline config
"
set cursorline
hi CursorLineNR gui=bold guibg=#15122e guifg=#ffffff
hi CursorLine guibg=#1e1c30

"
" Project management
"
nnoremap <C-m> :!make <CR>

"
" Multiplte cursor config
"
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-s>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"
" GruvBox config
"
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italicize_strings=1
let g:gruvbox_invert_signs=1

"
" auto-pairs config
"
let g:AutoPairs = {'(': ')', '[': ']', '{': '}', "'": "'", '"': '"'}

"
" Vim-Airline config options
"
let g:airline_left_sep=""
let g:airline_right_sep=""
let g:airline_theme='cobalt2'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_min_count=2
let g:airline#extensions#tabline#buffer_min_count=2
let g:airline#extensions#tabline#fnamemod=":t"
let g:airline_section_b='' " Hides git info
let g:airline_section_y='' " Hides file encoding

"
" Vim Tabs styling
"
highlight TabLineFill ctermfg=lightgreen  ctermbg=darkgreen
highlight TabLine     ctermfg=blue        ctermbg=yellow
highlight TabLineSel  ctermfg=red         ctermbg=yellow
highlight Title       ctermfg=lightblue   ctermbg=magenta

"
" Cursor styling
"
highlight Cursor guifg=black guibg=white

"
" CTRLP config
"
let g:ctrlp_show_hidden=1
let g:ctrlp_use_caching=0
let g:ctrlp_custom_ignore='\v[\/](node_modules|.git|.shards)$'

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
