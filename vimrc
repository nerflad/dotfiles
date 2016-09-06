runtime! archlinux.vim

set backupdir=~/.vim/backup
set directory=~/.vim/swap

set nocompatible    " Use Vim defaults instead of 100% vi compatiblity

set fileencodings=utf-8 "UTF-8 everywhere

if has("syntax")    " Enable syntax highlighting
  syntax on
endif

set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching

set incsearch       " Incremental search
set hlsearch        " Highlight all matching searches
nnoremap <C-l> :nohlsearch<CR><C-l> " Clear highlighted searches (refresh screen)

"set autowrite      " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned

set mouse=n          " Disable mouse

set number          " Always show line numbers
set ruler           " Always show cursor

set expandtab       " Expand tabs to spaces
set tabstop=4
set autoindent      " Automatically indent on newline (essential)

set linebreak       " If wrapping, don't break words
set nowrap          " Disable line wrapping

set splitbelow      " Put splits in the expected places for the English-speaking world
set splitright


" Color and highlighting stuff
set background=dark
if has ('gui_running')
    set guioptions-=T
    colo solarized
else
    colo solarized
    hi colorcolumn ctermbg=black ctermfg=none guibg=black
    hi CursorLine cterm=none ctermbg=black guibg=black
    hi StatusLine ctermbg=black
endif

hi LineNr ctermbg=black ctermfg=darkgrey

hi CursorLineNr ctermfg=brown
hi ColorColumn ctermbg=black

hi TrailingWhitespace ctermbg=red ctermfg=black
match TrailingWhitespace /\s\+$/

set cursorline
" set colorcolumn=80
execute "set colorcolumn=" . join(range(81,355), ',')


" Buffer bindings

map <f2> :bprevious<CR>
map <f3> :bnext<CR>
map <f4> :bdelete<CR>
map <f5> :tabnew<CR>

map <C-b> :buffers<CR>

nnoremap J mzJ`z    " Use a mark to preserve cursor position when joining lines


" CREDITS
" https://sanctum.geek.nz/arabesque/vim-search-highlighting/
" https://sanctum.geek.nz/arabesque/vim-annoyances/
" https://blog.hanschen.org/2012/10/24/different-background-color-in-vim-past-80-columns/
