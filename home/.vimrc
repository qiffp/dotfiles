" ___INCOMPLETE___

syntax on

set mouse=a  " enable the mouse for all modes
set backspace=indent,eol,start  " extended backspace functionality
set nobackup  " no file backups for current filei
set nowritebackup  " ^^
set noswapfile  " don't use a swapfile
set history=50  " keep 50 lines of command history
set ruler       " show the cursor position
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set directory=~/tmp  " swp file directory

" Make vim fast
set synmaxcol=300
set ttyfast
set ttyscroll=3
set lazyredraw

" Make mouse scrolling smoother
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

au VimResized * exe "normal! \<c-w>="  " resize splits when the window is resized

"""  REMAPS """

" remap esc to just mash a combination of j and k
inoremap kj <esc>
inoremap jk <esc>

" disable Ex mode
map Q <nop>

" go to next occurrence of current word
nnoremap * *<c-o>
