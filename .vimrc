"
" Operating System Settings
" Integration with system services
"
set shell=/bin/bash
set clipboard=unnamed
set encoding=utf-8
set laststatus=2
set t_Co=256
set backspace=2
set notimeout ttimeout ttimeoutlen=0
set number

"
" Vundle Setup
"
set nocompatible
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

call vundle#end()
filetype plugin indent on

"
" Navigation and control
"
let mapleader = ','
noremap <silent> <Up> gk
noremap <silent> <Down> gj
noremap <silent> k gk
noremap <silent> j gj
noremap <c-l> :bnext<CR>
noremap <c-h> :bprevious<CR>
noremap <c-n> :NERDTreeToggle<CR>

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
set guifont=Fira\ Mono\ Medium\ for\ Powerline
syntax enable
set background=dark
colorscheme gruvbox

let g:solarized_termcolors=16

"
" Vim-Airline config options
"
let g:airline_powerline_fonts=1
let g:airline_left_sep=""
let g:airline_right_sep=""
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_min_count=2
let g:airline#extensions#tabline#buffer_min_count=2
let g:airline#extensions#tabline#fnamemod=":t"

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
autocmd BufRead, BufNewFile *.ch setfiletype javascript
autocmd BufNewFile, BufReadPost *.md setfiletype markdown
autocmd BufWritePre * %s/\s\+$//e " Remove whitespace on file write

nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction
