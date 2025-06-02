if has('termguicolors')
  set termguicolors
endif
" https://github.com/sainnhe/gruvbox-material
colorscheme gruvbox-material

" Make background transparent even with colorscheme
" https://github.com/tribela/vim-transparent
packadd vim-transparent
TransparentEnable

" intuitive backspace behavior
set backspace=indent,eol,start
" show the current line number at the bottom-right of the screen
set ruler
set tabstop=2
set expandtab
set hlsearch
set nobackup
set noswapfile
set number relativenumber

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=nvi
endif

syntax on
" Enabling filetype support provides filetype-specific indenting,
" syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" Great command-line completion, use `<Tab>` to move
" around and `<CR>` to validate.
set wildmenu
