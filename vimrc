" Eric Bailey   nerflad@gmail.com
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set fileencodings=utf-8
set nocompatible    " Use Vim defaults instead of 100% vi compatiblity




" Initialize pathogen and configure some plugin values
execute pathogen#infect()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_ashes'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:signify_vcs_list = [ 'git' ]





if has("syntax")    " Enable syntax highlighting
  syntax on
endif

                    " Clear highlighted searches (refresh screen)
nnoremap <C-l> :nohlsearch<CR><C-l>
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
set splitright      " ^^
set suffixes=".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg
set tabstop=4       " Set tab stops
set shiftwidth=4    " ^^
set softtabstop=4   " ^^
set expandtab       " Expand tabs to spaces

" Color and highlighting stuff
let t_Co = 256      " Declare that we are in a 256 color terminal
colo solarized
if has ('gui_running')
    set guioptions-=T
else
    hi ColorColumn ctermbg=black ctermfg=none guibg=black
    hi CursorLine cterm=none ctermbg=black guibg=black
endif

hi LineNr ctermbg=black ctermfg=darkgrey
hi CursorLineNr ctermfg=brown

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


" Use a mark to preserve cursor position when joining lines
nnoremap J mzJ`z

" Swap boolean truthiness keywords using increment/decrement keys :)
function! ProvideAlternativeFacts()
    if expand('<cword>') == "True"
        execute "normal! ciwFalse"
    elseif expand('<cword>') == "False"
        execute "normal! ciwTrue"
    endif
endfunction
nnoremap <c-a> :call ProvideAlternativeFacts()<CR><C-a>
nnoremap <c-x> :call ProvideAlternativeFacts()<CR><C-x>

" CREDITS
" A lot of stuff from the default Debian and Arch Linux vimrc's
" vim.wikia.com/wiki/Vim_Tips_Wiki
" https://sanctum.geek.nz/arabesque/vim-search-highlighting/
" https://sanctum.geek.nz/arabesque/vim-annoyances/
" https://blog.hanschen.org/2012/10/24/different-background-color-in-vim-past-80-columns/
