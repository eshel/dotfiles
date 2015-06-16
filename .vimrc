
set nocompatible	                " vim, not vi
filetype off				" seems to be required for vundle

" Vundle initialization stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required!
Plugin 'gmarik/Vundle.vim'

" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

" Syntax
Plugin 'tpope/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'briangershon/html5.vim'
Plugin 'sukima/xmledit'
Plugin 'css3'
Plugin 'django.vim'
Plugin 'python.vim--Vasiliev'
Plugin 'indentpython.vim'
let python_highlight_all=1          " Enable all plugin's highlighting
let python_print_as_function=1      " Color 'print' function

Plugin 'scrooloose/syntastic'

" Other plugins
Plugin 'camelcasemotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'AutoTag'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on



" vim-thrift
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source $VIM/syntax/thrift.vim

" Terminal / GUI
set t_Co=256            " Set terminal to display 256 colors

" Colors
syntax enable
set background=dark
colorscheme molokai

" Custom settings

set fileformats=unix,dos,mac	        " support all three newline formats

set nowrap          " no line wrapping
set linebreak       " wrap at word

set showmatch       " show matchingbrace on insertion or cursor over.
set matchtime=3     " how many tenths of a second to wait before showing matching braces
set matchpairs+=<:> " treat <> as matching braces

" Omni completion
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS



" Indentation
set autoindent  " Automatically set the indent of a new line (local to buffer).
set smartindent
"set shiftround  " Round shift actions. i.e. When at 3 spaces, and I hit > ... go to 4, not 5. FIXME: Doesn't work.

" expandtab  = All tabs will be spaces.
" softabstop = How many spaces will a tab take when 'expandtab' is on.
" smarttab   = delete chunks of spaces like tabs.
" tabstop    = How many spaces is a tab (visually).
" shiftwidth = How many spaces will a 'shift' command take.
autocmd BufWinEnter,FileType *,python,javascript set expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4  " This includes default behaviour.
autocmd BufWinEnter,FileType html,css            set expandtab smarttab tabstop=2 softtabstop=2 shiftwidth=2  " FIXME: Doesn't work.


" Searching
"set hlsearch  " Highlight search.
set smartcase  " Be case sensitive when input has a capital letter.
set incsearch  " Show matches while typing.
set ignorecase  " Ignore case when searching.


" Folding
set foldenable  " Turn on folding.
set foldmethod=marker  " Fold on the marker.
set foldlevel=100  " Don't autofold anything (but I can still fold manually).
set foldopen=block,hor,tag,percent,mark,quickfix  " Which movements open folds.


" Backup
set nobackup        " Disable file backup before file overwrite attempt
set nowritebackup


" Status Line
set shortmess=at  " Shortens messages in status line, truncates long messages.
set laststatus=2  " Always show status line.
set showcmd  " Display an incomplete command in status line.
set ruler  " Show file status ruler. NOTE: Doesn't work with buftabs.vim plugin.
"set ch=2  " Make command line two lines high


" Invisible characters.
if ! has("win32")
    "set listchars=tab:▸\ ,trail:¬,eol:«  " Invisible characters.
    "set listchars=tab:°\ ,trail:·,eol:☠  " Alternate invisible characters.
    "set listchars=tab:▷⋅,trail:⋅,nbsp:⋅    
endif

"set list  " Display invisible characters.
set nolist  " Don't display invisible characters.

" Mouse
set mouse=a     " enable mouse
"set mouse-=a   " disable mouse
set mousehide   " hide mouse after chars type
behave xterm    " make mouse behave like in xterm
set selectmode=mouse    " enable visual selection with mouse

" Ignored files
set wildignore+=*.jpg,*.jpeg,*.png,*.gif  " Ignore images
set wildignore+=*.pdf  " Ignore PDF files
set wildignore+=*.pyc,*.pyo  " Ignore compiled Python files

"set wildignorecase      " in-case-sensitive dir/file completion

set tags=./tags;/       " Search tag list from current dir up till root

set clipboard+=unnamed      " Enable OS clipboard integration

" Others

set textwidth=0     " 0 means no auto-wrapping
set autoindent				" set the cursor at same indent as line above
set smartindent				" try to be smart about indenting (C-style)
set expandtab				" expand tabs with spaces
set shiftwidth=4			" spaces for each step of (auto)indent
set softtabstop=4			" set virtual tab stop (compat for 8-wide tabs)
set tabstop=8				" for proper display of files with tabs
set shiftround				" always round indents to multiple of shiftwidth
set copyindent				" use existing indents for new indents
set preserveindent			" save as much indent structure as possible

set number          " line numbers
set numberwidth=5   " width of numbers column

" Syntastic settings
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['pyflakes', 'python']
