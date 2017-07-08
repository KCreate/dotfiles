"
" Operating System Settings
" Integration with system services
"
set backspace=2
set clipboard=unnamed
set encoding=utf-8
set guioptions+=m
set guioptions-=L
set guioptions-=R
set guioptions-=b
set guioptions-=h
set guioptions-=l
set guioptions-=r
set hidden
set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase
set laststatus=2
set nocompatible
set notimeout ttimeout ttimeoutlen=0
set number
set shell=/bin/bash
set t_Co=256
set modelines=0
set vb
set mousehide

"
" Save undo history accross reloads
"
set undofile
set undodir=~/.vim/undo/

"
" Comments
"
" c - Auto-wrap comments using textwidth, inserting the current comment leader automatically.
" o - Automatically insert the current comment leader after hitting ‘o’ or ‘O’ in Normal mode.
" t - Auto-wrap text using textwidth
" q - Allow formatting of comments with “gq”.
" r - Automatically insert the current comment leader after hitting in Insert mode.
"
set formatoptions=cotqr

" Disable backup and swap files
" Took me 1 year to find this option
set nobackup
set nowritebackup
set noswapfile

"
" Navigation and control
"
let mapleader = ","
nnoremap - /
nnoremap <c-h> :bprevious<CR>
nnoremap <c-l> :bnext<CR>
nnoremap <c-n> :NERDTreeToggle<CR>
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <c-j> 10j
vnoremap <c-j> 10j
nnoremap <c-k> 10k
noremap <c-k> 10k

"
" Split management
"
nnoremap s= <C-W>=

" Quick-access to todos and scratchpad file
nnoremap st :split ~/dotfiles/todos.md<CR>       :exe "resize " . (winheight(0) * 2/5)<CR>
nnoremap ss :split ~/dotfiles/scratchpad.txt<CR> :exe "resize " . (winheight(0) * 2/5)<CR>

nnoremap sd :vsplit<CR>
nnoremap sw :split<CR>
nnoremap sq <C-W>q
nnoremap sh <C-W><left>
nnoremap sj <C-W><down>
nnoremap sk <C-W><up>
nnoremap sl <C-W><right>
nnoremap <Leader>q :Bdelete<CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Automatically equalize all splits when resizing the window
autocmd VimResized * wincmd =
autocmd VimResized * redraw!

" Automatically read the file when it was changed from an outside session
set autoread

"
" Vundle Setup
"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'MaxSt/FlatColor'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lifepillar/vim-solarized8'
Plugin 'mhinz/vim-grepper'
Plugin 'moll/vim-bbye'
Plugin 'morhetz/gruvbox'
Plugin 'plasticboy/vim-markdown'
Plugin 'pseewald/vim-anyfold'
Plugin 'rhysd/vim-crystal'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/badwolf'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'timakro/vim-searchant'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'unblevable/quick-scope'
Plugin 'junegunn/goyo.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'

call vundle#end()
filetype plugin indent on

set autoindent
set expandtab
set mouse=a
set noshowmode " Hides the default vim status bar
set shiftround
set shiftwidth=2
set showbreak=...
set smartindent
set softtabstop=2
set tabstop=2
set ttyfast
set wildmenu

" Folding
set foldmethod=indent
set nofoldenable
let anyfold_activate=1
set foldlevel=0

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
nnoremap <leader>ga :!git add %<CR>
nnoremap <leader>gc :!git commit <CR>
nnoremap <leader>gp :!git p <CR>
nnoremap <leader>gs :!git s <CR>

"
" Substitutions
"
set gdefault

"
" Completions
"
set complete+=kspell

"
" Enhanced CPP highlighting
"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"
" Aesthetic settings

if has('gui_macvim')
  set guifont=Hack:h11
endif

set termguicolors
set colorcolumn=100
syntax enable

"
" Available themes
" gruvbox-dark
" gruvbox-light
" badwolf
"
let theme="badwolf"

if theme == "gruvbox-dark"
  set background=dark
  highlight Cursor guifg=black
  colorscheme GruvBox
elseif theme == "gruvbox-light"
  set background=light
  highlight Cursor guifg=white
  colorscheme GruvBox
elseif theme == "badwolf"
  set background=dark
  highlight Cursor guifg=black
  colorscheme badwolf
elseif theme == "solarized8-dark"
  set background=dark
  highlight Cursor guifg=black
  colorscheme solarized8_dark_flat
elseif theme == "solarized8-light"
  set background=light
  highlight Cursor guifg=white
  colorscheme solarized8_light_flat
endif

"
" Multiple cursor config
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
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italicize_strings=1
let g:gruvbox_invert_signs=1

"
" auto-pairs config
"
let g:AutoPairs = {'(': ')', '[': ']', '{': '}', "'": "'", '"': '"'}

"
" Vim-Airline config options
"
let g:airline#extensions#tabline#buffer_min_count=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=":t"
let g:airline_left_sep=""
let g:airline_right_sep=""
let g:airline_section_y='' " Hides file encoding
let g:airline_theme='cool'

"
" CTRLP config
"
let g:ctrlp_custom_ignore='\v[\/](node_modules|.git|.shards)$'
let g:ctrlp_show_hidden=1
let g:ctrlp_use_caching=0

"
" Filetypes
"
au BufNewFile,BufReadPost *.md set filetype=markdown
au BufNewFile,BufReadPost *.ch set filetype=javascript

"
" Remove whitespace on file write
"
au BufWritePre * %s/\s\+$//e

"
" Highlight lines longer than 100 columns with a red background
"
highlight OverLength ctermbg=red ctermfg=white guifg=white guibg=#FF5C57
match OverLength /\%121v.\+/

"
" This fixes indendation for C switch cases
"
set cinoptions=l1

"
" Fix scrolling in console
"
if has("gui_running")
else
  map <ScrollWheelUp> <C-Y>
  map <S-ScrollWheelUp> <C-U>
  map <ScrollWheelDown> <C-E>
  map <S-ScrollWheelDown> <C-D>
endif

" Quickly select the text that was just pasted
noremap gV `[v`]

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" Insert two new lines here
nnoremap <S-L> O<ESC>o

" Neovim config
if has('nvim')
  " NeoVim escape the terminal
  " œ is produced by Alt + q (on mac)
  tnoremap œ <C-\><C-n>

  " Fix backspace in neovim
  vnoremap <BS> d
endif
