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
set shell=fish
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
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <c-j> 10j
nnoremap <s-j> 10j
vnoremap <c-j> 10j
vnoremap <s-j> 10j
nnoremap <c-k> 10k
nnoremap <s-k> 10k
vnoremap <c-k> 10k
vnoremap <s-k> 10k

" Whole-line visual mode
nnoremap <s-e> V
nnoremap <c-e> V

"
" Move lines with Alt+J and Alt+K
"
nnoremap º :m .+1<CR>==
nnoremap ∆ :m .-2<CR>==

inoremap º <Esc>:m .+1<CR>==gi
inoremap ∆ <Esc>:m .-2<CR>==gi

vnoremap º :m '>+1<CR>gv=gv
vnoremap ∆ :m '<-2<CR>gv=gv

"
" Split management
"
nnoremap s= <C-W>=

" Quick-access to todos and scratchpad file
nnoremap ss :split todos.md<CR>       :exe "resize " . (winheight(0) * 2/5)<CR>
nnoremap st :split<CR>                :exe "term"<CR>
tnoremap <Esc> <C-\><C-n>

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
call vundle#rc()

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Language support
Plugin 'dag/vim-fish'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'plasticboy/vim-markdown'
Plugin 'rhysd/vim-crystal'

" Looks and integration
Plugin 'airblade/vim-gitgutter'
Plugin 'moll/vim-bbye'

" Editing
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/goyo.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'

" Files & search
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'timakro/vim-searchant'
Plugin 'dyng/ctrlsf.vim'

" Themes
Plugin 'MaxSt/FlatColor'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'ajh17/spacegray.vim'
Plugin 'cocopon/iceberg.vim'
Plugin 'dracula/vim'
Plugin 'endel/vim-github-colorscheme'
Plugin 'https://github.com/ayu-theme/ayu-vim'
Plugin 'kabbamine/yowish.vim'
Plugin 'lifepillar/vim-solarized8'
Plugin 'mkarmona/materialbox'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'nightsense/nemo'
Plugin 'rakr/vim-one'
Plugin 'romainl/Apprentice'
Plugin 'sjl/badwolf'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'zefei/cake16'
Plugin 'arzg/vim-colors-xcode'

call vundle#end()
filetype plugin indent on

function UpdateVim()
  set shell=bash
  PluginInstall
  set shell=fish
endfunction

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
" Misc. settings
"
set updatetime=500

"
" Completions
"
set noinfercase           " ignore case of typed text, always use case of completed word
setglobal complete-=t     " do not search for tags

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
" Table Mode Config
"
let g:table_mode_corner='|'

"
" Toggle nerdtree
"
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"
" vim-clang-format
"
let g:clang_format#detect_style_file=1
let g:clang_format#enable_fallback_style=1
vnoremap f :ClangFormat<CR>

"
" Aesthetic settings

if has('gui_macvim')
  set guifont=Hack:h11
endif

set termguicolors
set colorcolumn=120
syntax enable
let theme="xcode-dark"

if theme == "gruvbox-dark"
  set background=dark
  colorscheme gruvbox

elseif theme == "gruvbox-light"
  set background=light
  colorscheme gruvbox

elseif theme == "badwolf"
  set background=dark
  colorscheme badwolf

elseif theme == "solarized8-dark"
  set background=dark
  colorscheme solarized8_dark_flat

elseif theme == "solarized8-light"
  set background=light
  colorscheme solarized8_light_flat

elseif theme == "dracula"
  set background=dark
  colorscheme dracula

elseif theme == "materialbox-light"
  set background=light
  colorscheme materialbox

elseif theme == "materialbox-dark"
  set background=dark
  colorscheme materialbox

elseif theme == "apprentice"
  set background=dark
  colorscheme apprentice

elseif theme == "iceberg"
  set background=dark
  colorscheme iceberg

elseif theme == "cake16"
  set background=light
  colorscheme cake16

elseif theme == "github"
  set background=light
  colorscheme github

elseif theme == "one-light"
  set background=light
  colorscheme one

elseif theme == "one-dark"
  set background=dark
  colorscheme one

elseif theme == "papercolor-light"
  set background=light
  colorscheme PaperColor

elseif theme == "papercolor-dark"
  set background=dark
  colorscheme PaperColor

elseif theme == "jellybeans"
  set background=dark
  colorscheme jellybeans

elseif theme == "yowish"
  set background=dark
  colorscheme yowish

elseif theme == "spacegray"
  set background=dark
  colorscheme spacegray

elseif theme == "iceberg"
  set background=dark
  colorscheme iceberg

elseif theme == "nemo-dark"
  set background=dark
  colorscheme nemo-dark

elseif theme == "nemo-light"
  set background=light
  colorscheme nemo-light

elseif theme == "ayu-light"
  set background=light
  let ayucolor="light"
  colorscheme ayu

elseif theme == "ayu-mirage"
  set background=dark
  let ayucolor="mirage"
  colorscheme ayu

elseif theme == "ayu-dark"
  set background=light
  let ayucolor="dark"
  colorscheme ayu


elseif theme == "xcode-light"
  set background=light
  let g:xcodelight_green_comments = 1
  let g:xcodelight_match_paren_style = 1
  colorscheme xcodelight

elseif theme == "xcode-dark"
  set background=dark
  let g:xcodedark_green_comments = 1
  let g:xcodedark_match_paren_style = 1
  colorscheme xcodedark

endif

if &background == "dark"
  highlight Cursor guibg=yellow
else
  highlight Cursor guibg=yellow
end

"
" EasyAlign config
"
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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
let g:airline#extensions#tabline#buffer_min_count=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=":t"
let g:airline#extensions#hunks#enabled=0
let g:airline_left_sep=""
let g:airline_right_sep=""
let g:airline_section_y="" " Hides file encoding
let g:airline_section_z="" " Hides percentage, line number, column number
let g:airline_theme='tomorrow'

"
" CTRLP config
"
" This is the filepicker
"
let g:ctrlp_custom_ignore = '\v[\/](node_modules|.git|.shards)$'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:20,max:20,results:20'
let g:ctrlp_switch_buffer = 'E'

"
" CTRLSF config
"
" This is the file searcher
nmap _ <Plug>CtrlSFPrompt
vmap _ <Plug>CtrlSFVwordExec
let g:ctrlsf_confirm_save = 0 " Disable confirmation on saving edits
let g:ctrlsf_auto_preview = 1 " Automatically change preview while moving from match to match
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_search_mode = 'async'

"
" Filetypes
"
au BufNewFile,BufReadPost *.md set filetype=markdown
au BufNewFile,BufReadPost *.ch set filetype=charly

"
" Remove whitespace on file write
"
au BufWritePre * %s/\%u00A0/ /e
au BufWritePre * %s/\s\+$//e

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

" Stay in visual mode when indenting
nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

" Insert two new lines here
nnoremap <S-L> O<ESC>o

" Neovim config
if has('nvim')

  " Fix backspace in neovim
  vnoremap <BS> d
endif
