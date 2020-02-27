set nocompatible " be iMproved, required (Vundle)
filetype off     " required (Vundle)

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'mileszs/ack.vim' " grep for vim
Plugin 'junegunn/fzf.vim' " fuzzy file search
Plugin 'docunext/closetag.vim' " html tag closing
Plugin 'scrooloose/nerdcommenter' " easy commenting
Plugin 'scrooloose/nerdtree' " file browser
Plugin 'bling/vim-airline' " neat vim status stuff
Plugin 'vim-airline/vim-airline-themes' " airline themes (for g:airline_theme)
Plugin 'bronson/vim-trailing-whitespace' " highlight extra whitespace
Plugin 'altercation/vim-colors-solarized' " Solarized colourscheme
Plugin 'tpope/vim-fugitive' " git functionality in vim...mostly for airline
Plugin 'airblade/vim-gitgutter' " git status in the sidebar
Plugin 'a.vim' " switching between source and header files
Plugin 'mru.vim' " recently opened files
Plugin 'sheerun/vim-polyglot' " majority language support

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set backspace=indent,eol,start  " extended backspace functionality
set clipboard=unnamed " share system clipboard
set completeopt-=preview " disable scratch
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
set nohlsearch " disable highlighting for search

" Make vim fast
set lazyredraw
set synmaxcol=300
set ttyfast

" Colours
" set background=dark
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
" show the current file in nerd tree
nnoremap <leader>B :NERDTreeFind<CR>

" switch between source and header files
nnoremap <leader>s :A<CR>

" grep
nnoremap <leader>f :Ack<Space>

" file fuzzy search
nnoremap <C-P> :Files<CR>

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
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

" ag
let g:ag_highlight = 1

" fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'down': '~40%' }

" nerdtree
let NERDTreeShowHidden=1

" exit vim if nerd tree is the only tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
  set grepprg=ag\ --vimgrep\ smart-case
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" closetag enabled for embedded html
let g:closetag_html_style = 1

" don't conceal quotation marks in json files
let g:vim_json_syntax_conceal = 0

" highlight .js files as .jsx
let g:jsx_ext_required = 0

