filetype on
filetype indent on
filetype plugin on

"" setting truecolors
set t_Co=256
if has('nvim')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"" setting runtime path
set runtimepath+=~/.config/nvim/autoload
runtime autoload/**/*.vim
runtime macros/matchit.vim

"" syntax highlighting
syntax on
syntax enable
colorscheme sinokai

"" encoding
set encoding=utf-8 " kind of characters which Vim can work with
"" set this options causes E213
" set fileencoding=uft-8 " character encoding for the file of this buffer
" set fileencodings=utf-8 " character encodings considered when edit an file.
""
set bomb
set binary
set ttyfast

"" backup/files
set shortmess-=f " (file x of y) instead of (x of y)
set shortmess+=c " don't give ins-completion-menu(:help) message.

" no backup files, no write backup, no swap file 
set nobackup
set nowritebackup
set noswapfile

"" shell
set showcmd
set shell=/bin/zsh " set default terminal

"" A buffer is marked as 'hidden' if it has unsaved changes, and it is not
"" currently loaded in a window. If you try and quit Vim while there are hidden
"" buffers, you will raise an error:
"" E162 No Write since last change for buffer 'filename.txt'
set hidden " allow buffer switching without saving

"" Refresh buffer if file has been changed externally.
"" Note that this doesn't automatically run every some interval.
set autoread

"" map leader
let mapleader=','

"" always show cursor
set ruler

"" cursor line
set cursorline

"" line numbers
set number relativenumber

"" show tabline
set showtabline=2 " always show tabline

"" status bar
set laststatus=2 " always show status bar
set noshowmode

"" set the statusline to something useful
set title
set titleold="Terminal"

"" windows
set lazyredraw " only redraw if it's needed
set splitbelow " put a new window below the current one
set splitright " put a new window right of the current one

"" searching
set hlsearch " highlight search matches
set incsearch " incremental searching (digita e vai buscando)
set inccommand=split
set ignorecase " don't need escape character
set smartcase " ignorecase in search
set showmatch " show barckets matching highlight

"" text
set formatoptions+=w " trailing white space indicates a paragraph
set textwidth=79 " maximum width
set colorcolumn=80
set nowrap " turn word wrap off
set backspace=indent,eol,start " allows backspacing over autoindent,eol,start

"" tabs and spaces
set smarttab " inserts blanks according to 'shiftwidth'
set expandtab " convert tabs to spaces
set tabstop=2 " set tabsize in spaces (for manual indenting)
set shiftwidth=2 " the number of spaces for tab (auto indent)
set list listchars=tab:\ \ , " chars to be used to show a tab and trails

"" foldering
set nofoldenable
set foldmethod=indent
set foldminlines=3
