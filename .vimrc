set nocompatible              " Don't be compatible with vi
filetype off                  " required by Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'mileszs/ack.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
"Plugin 'davidhalter/jedi-vim'
Plugin 'jnurmine/Zenburn'

" Plugins must be added before the following line
call vundle#end()             " required

" Basic settings
syntax on                     " Syntax highlighing
filetype on                   " Try to detect filetypes
filetype plugin indent on     " Enable loading indent file for filetype
set t_Co=256                  " Support for 256 color terminal
set number                    " Display line numbers
set numberwidth=1             " Using only 1 column (and 1 space) if possible
set background=dark           " We are using dark background
set title                     " Show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set wildignore+=*.o,*.obj,.git,*.pyc,*.pyo,*swp,eggs/**,*.egg-info/**,*.un~ " Ignore these files when completing
set backupdir=~/.vim/tmp/bak/ " Backup files folder
set directory=~/.vim/tmp/swp/ " Swap files folder

colorscheme zenburn
colors zenburn

" Moving Around/Editing
set encoding=utf-8          " Set encoding to UTF-8
set cursorline              " Have a line indicate the cursor location
set ruler                   " Show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set nowrap                  " Don't wrap text
set linebreak               " Don't wrap textin the middle of a word
set autoindent              " Always set autoindenting on
set smartindent             " Use smart indent if there is no indent file
set tabstop=2               " <Tab> inserts the set number of spaces
set shiftwidth=2            " Indent level is the set number of spaces wide
set softtabstop=2           " <BS> over an autoindent deletes both spaces
set smarttab                " Handle tabs more intelligently
set expandtab               " Use spaces, not tabs, for autoindent/tab key
set shiftround              " Rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " Show matching <> (html mainly) as well
set foldmethod=indent       " Allow us to fold on indents
set foldlevel=99            " Don't fold by default
set colorcolumn=80          " Color column to mark the end 80 char limit
set iskeyword+=_            " Underscore is part of a word in my world.
set completeopt=menuone,longest,preview " Insert completion - don't select first item, follow typing in autocomplete
set pumheight=8             " Keep a small completion window
set hidden                  " Hide buffer without writing changes to file

" Creates undo files (*.un~) for undoes after close/open file (vim 7.3)
"set undofile

" Reading/Writing
set noautowrite             " Never write a file unless I request it
set noautowriteall          " NEVER
set noautoread              " Don't automatically re-read changed files
set nomodeline              " Disallow vim options to be embedded in files
set modelines=0             " Same as above
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings

" Messages, Info, Status
set ls=2                    " Allways show status line
set noerrorbells
set novisualbell
set vb t_vb=                " Disable all bells, blinks and whatnot
set confirm                 " Y-N-C prompt if closing with unsaved changes
set showcmd                 " Show incomplete normal mode commands as I type
set report=0                " : commands always print changed line count
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written
set laststatus=2            " Always show statusline, even if only 1 window
"set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" Displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,trail:·,precedes:<,extends:>
set list

" Searching and Patterns
nnoremap / /\v
vnoremap / /\v
set ignorecase              " Default to using case insensitive searches,
set smartcase               " Unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set showmatch               " Briefly jump to a paren once it's balanced
set incsearch               " Incrementally search while typing a /regex
set gdefault                " Applies substitutions globally on lines


let mapleader=","             " Change the leader to be a comma vs slash

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" Hide matches on <leader>space
nnoremap <leader><space> :noh<CR>
nnoremap <tab> %
vnoremap <tab> %

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Python specific
au Filetype python setl ts=4 sts=4 sw=4 expandtab
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setl cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
map <leader>d :normal Oimport pdb;pdb.set_trace()<ESC>

au Filetype javascript setl ts=4 sts=4 sw=4 expandtab

" Reload .vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" NerdTree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.git$', '__pycache__']
let NERDTreeShowHidden=1

" Toggle paste mode
map <leader>p :set paste!<CR>

" Quit window on <leader>q or :Q
command! Q :q
nnoremap <leader>q :q<CR>

" Save on <leader>w or :W
command! W :w
nnoremap <leader>w :w<CR>

" Cycle through bufers
nnoremap <leader>z :bn<CR>
nnoremap <leader>x :bp<CR>

" Correct my typos
command! Wq :wq
command! WQ :wq

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Syntastic
let g:syntastic_check_on_open=1

" Airline setup
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
