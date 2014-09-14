set nocompatible " be iMproved, required (Vundle)
filetype off     " required (Vundle)

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'rking/ag.vim' " multi-file search
Plugin 'docunext/closetag.vim' " html tag closing
Plugin 'kien/ctrlp.vim' " fuzzy search to open files
Plugin 'FelikZ/ctrlp-py-matcher' " way faster ctrlp searching
Plugin 'scrooloose/nerdcommenter' " easy commenting
Plugin 'Shougo/neocomplete.vim' " better autocomplete
Plugin 'scrooloose/nerdtree' " file browser
Plugin 'bling/vim-airline' " neat vim status stuff
Plugin 'ntpeters/vim-better-whitespace' " highlight extra whitespace
Plugin 'altercation/vim-colors-solarized' " Solarized colourscheme
Plugin 'tpope/vim-fugitive' " git functionality in vim...mostly for airline
Plugin 'airblade/vim-gitgutter' " git status in the sidebar
Plugin 'a.vim' " switching between source and header files
Plugin 'mru.vim' " recently opened files

" Language support
Plugin 'kchmck/vim-coffee-script'
Plugin 'elzr/vim-json'
Plugin 'othree/html5.vim'
Plugin 'nono/jquery.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jnwhiteh/vim-golang'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'wting/rust.vim'
Plugin 'cespare/vim-toml'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set backspace=indent,eol,start  " extended backspace functionality
set clipboard=unnamed " share system clipboard
set cursorline " highlight the current line
set directory=~/tmp  " swp file directory
set encoding=utf-8 " utf-8 character encoding
set history=50  " keep 50 lines of command history
set ignorecase " used with smartcase - ignore case in searches
set incsearch   " start searching as you type
set laststatus=2 " to make airline show up
set mouse=a  " enable the mouse for all modes
set nobackup  " no file backups for current file
set noswapfile  " don't use a swapfile
set nowritebackup  " no file backups for current file
set number " numbered lines
set ruler       " show the cursor position
set showcmd     " display incomplete commands
set showmatch " show matching parenthesis
set smartcase " used with ignorecase - if search has a capital letter, do case-sensitive search, else case-insensitive
set title " set the terminal title

" Make vim fast
set lazyredraw
set synmaxcol=300
set ttyfast
set ttyscroll=3

" Colours
set background=dark
colorscheme solarized

" Tabs / indenting
set tabstop=2 " display tabs as 2 spaces
set shiftwidth=2 " autoindent 2 spaces
set softtabstop=2 " indent 2 spaces when you hit tab
set expandtab " expand tab to number of spaces defined in softtabstop
set shiftround " use shiftwidth when adjusting indentation with '<<' and '>>'
set smarttab " autoindent using shiftwidth, not tabstop
set autoindent " always autoindent
set copyindent " use existing indenting
set cindent " C indenting

" Tabs for C
autocmd Filetype h,hpp,c,cpp,cs,m :setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" Make mouse scrolling smoother
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

au VimResized * exe "normal! \<c-w>="  " resize splits when the window is resized

"""  REMAPS """

" remap esc to mashing a combination of j and k
inoremap kj <esc>
inoremap jk <esc>
inoremap KJ <esc>
inoremap JK <esc>

" remap leader to ','
let mapleader = ","
let g:mapleader = ","

" tabs
nnoremap <leader><tab> :tabnext<CR>
nnoremap <leader><S-tab> :tabprev<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>t :tabnew<CR>

" disable Ex mode
map Q <nop>

" toggle nerd tree
nnoremap <leader>b :NERDTreeToggle<CR>

" switch between source and header files
nnoremap <leader>s :A<CR>

" find shortcut
nnoremap <leader>f :Ag 

" show recently opened files
nnoremap <leader>T :MRU<CR>

""" PLUGIN CONFIGURATION """

" gitgutter
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 1
let g:gitgutter_sign_column_always = 1
let g:gitgutter_updatetime = 1000
highlight clear SignColumn

" airline
let g:airline_enable_branch = 1
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

" exit vim if nerd tree is the only tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" pymatcher for ctrlp
if !has('python')
  echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''*.o'' --hidden -g ""'
endif

" closetag enabled for embedded html
let g:closetag_html_style = 1

" don't conceal quotation marks in json files
let g:vim_json_syntax_conceal = 0
