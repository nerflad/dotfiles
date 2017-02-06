" Eric Bailey   nerflad@gmail.com
set backupdir=~/.vim/backup
set directory=~/.vim/swap

set nocompatible    " Use Vim defaults instead of 100% vi compatiblity
set fileencodings=utf-8 "UTF-8 everywhere


" Initialize pathogen plugins
execute pathogen#infect()
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'

if has("syntax")    " Enable syntax highlighting
  syntax on
endif

"set autowrite      " Automatically save before commands like :next and :make
nnoremap <C-l> :nohlsearch<CR><C-l> " Clear highlighted searches (refresh screen)
set autoindent      " Automatically indent on newline
set backspace=indent,eol,start  " Make backspacing work as expected
set breakindent     " If wrapping, match indentation of current line
set hidden          " Hide buffers when they are abandoned
set history=50      " Remember previous 50 commands
set hlsearch        " Highlight all matching searches
set incsearch       " Incremental search
set linebreak       " If wrapping, don't break words
set mouse=          " Disable mouse
set nowrap          " Disable line wrapping
set number          " Always show line numbers
set ruler           " Always show cursor
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching...
set smartcase       " ...unless using capital letters
set splitbelow      " Put splits in the expected places for the English-speaking world
set splitright      " ''
set suffixes=".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg
set tabstop=4       " Set tab stops
set shiftwidth=4    "
set softtabstop=4   "
set expandtab       " Expand tabs to spaces

" Color and highlighting stuff
let t_Co = 256      " Declare that we are in a 256 color terminal
colo solarized
if has ('gui_running')
    set guioptions-=T
else
    hi colorcolumn ctermbg=black ctermfg=none guibg=black
    hi CursorLine cterm=none ctermbg=black guibg=black
    hi StatusLine ctermbg=black
endif

hi LineNr ctermbg=black ctermfg=darkgrey
hi CursorLineNr ctermfg=brown
hi ColorColumn ctermbg=black

set background=light " This must go after other highlight rules so they aren't overridden

" solarized.vim has its own whitespace highlight rule, which we override here
hi TrailingWhitespace ctermbg=red ctermfg=black
match TrailingWhitespace /\s\+$/

set cursorline
execute "set colorcolumn=" . join(range(81,355), ',')


" Buffer bindings

map <f2> :bprevious<CR>
map <f3> :bnext<CR>
map <f4> :bdelete<CR>
map <f5> :tabnew<CR>

map <C-b> :buffers<CR>

nnoremap J mzJ`z    " Use a mark to preserve cursor position when joining lines

" Swap boolean truthiness keywords using increment/decrement keys :)
function! AlternateFacts()
    if expand('<cword>') == "True"
        execute "normal! ciwFalse"
    elseif expand('<cword>') == "False"
        execute "normal! ciwTrue"
    endif
endfunction

nnoremap <c-a> :call AlternateFacts()<CR><C-a>
nnoremap <c-x> :call AlternateFacts()<CR><C-x>

" CREDITS
" vim.wikia.com/wiki/Vim_Tips_Wiki
" https://sanctum.geek.nz/arabesque/vim-search-highlighting/
" https://sanctum.geek.nz/arabesque/vim-annoyances/
" https://blog.hanschen.org/2012/10/24/different-background-color-in-vim-past-80-columns/
