runtime! archlinux.vim

set backupdir=~/.vim/backup
set directory=~/.vim/swap

set nocompatible    " Use Vim defaults instead of 100% vi compatiblity

set fileencodings=utf-8 "UTF-8 everywhere

if has("syntax")    " Enable syntax highlighting
  syntax on
endif

set background=dark " This is to change certain highlighting rules... I think

set showcmd         " Show (partial) command in status line.
"set showmatch      " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching

set incsearch       " Incremental search
set hlsearch        " Highlight all matching searches

                    " Clear highlighted searches (and screen)
nnoremap <C-l> :nohlsearch<CR><C-l>
                    " https://sanctum.geek.nz/arabesque/vim-search-highlighting/

"set autowrite      " Automatically save before commands like :next and :make
"set hidden         " Hide buffers when they are abandoned

set mouse=          " disable mouse buttons (scrolling works... in xfce terminal anyway)

set number          " Always show line numbers
set ruler           " Always show cursor

set expandtab       " Expand tabs to spaces
set tabstop=4
set autoindent      " Automatically indent on newline (essential)

set linebreak       " If wrapping, don't break words
"set nowrap          " Disable line wrapping

set splitbelow      " Put splits in the expected places for the English-speaking world
set splitright

" Color and highlighting stuff
colo slate
hi LineNr ctermfg=black guibg=black

hi CursorLine cterm=none ctermbg=black guibg=black
hi CursorLineNr ctermfg=yellow
set cursorline

hi StatusLine ctermbg=black guibg=black

" Highlight characters outside of long lines
" http://stackoverflow.com/a/235970/5920858
"hi OverLength ctermbg=red ctermfg=black
hi TrailingWhitespace ctermbg=red ctermfg=black

"match OverLength /\%81v.\+/
match TrailingWhitespace /\s\+$/

hi colorcolumn ctermbg=black ctermfg=none guibg=black
set colorcolumn=80
" change background color outside of 80 columns for strict line length
" https://blog.hanschen.org/2012/10/24/different-background-color-in-vim-past-80-columns/
"execute "set colorcolumn=" . join(range(81,355), ',')

" GUI Settings
set tb=             " No toolbar


" Buffer bindings
map <f2> :bprevious<CR>
map <f3> :bnext<CR>
map <f4> :bdelete<CR>

                    " Use a mark to preserve cursor position when joining lines
nnoremap J mzJ`z    " https://sanctum.geek.nz/arabesque/vim-annoyances/
