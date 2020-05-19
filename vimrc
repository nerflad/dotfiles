" Eric Bailey   nerflad@gmail.com
scriptencoding utf-8
set fileencodings=utf-8

set backupdir=~/.vim/backup
set directory=~/.vim/swap
set suffixes=".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

set nocompatible    " Start with Vim defaults

" {{{ Initialize pathogen and configure some plugin values
execute pathogen#infect()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_ashes'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:signify_vcs_list = [ 'git' ]
" }}}


if has("syntax")    " Enable syntax highlighting
  syntax on
endif

set ai              " Always set auto-indenting on
set bs=2            " Backspace over everything in insert mode

set nowrap          " Disable line wrapping
set breakindent     " If wrapping, match indentation of current line
set linebreak       " If wrapping, don't break words

" {{{ Search/highlighting
" Clear highlighted searches (refresh screen)
nnoremap <C-l> :nohlsearch<CR><C-l>
set hlsearch        " Highlight all matching searches
set incsearch       " Incremental search
set ignorecase      " Do case insensitive matching...
set smartcase       " ...unless using capital letters
" }}}

set laststatus=2    " Always show statusline
set showcmd         " Show (partial) command in status line.

set mouse=          " Disable mouse
set number          " Always show line numbers
set numberwidth=3   " Don't show obnoxiously large number column
" set relativenumber  " Show line numbers relative to cursor
set ruler           " Always show cursor
set hidden          " Hide buffers when they are abandoned
set history=50      " Remember previous 50 commands
set showmatch       " Show matching brackets.

set splitbelow      " Put splits in the expected places for the English-speaking world
set splitright      "

" {{{ Tab settings
set tabstop=4       " Set tab stops
set shiftwidth=4    "
set softtabstop=4   "
set expandtab       " Expand tabs to spaces
" }}}

" {{{ Color and highlighting stuff
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

set background=dark " This must go after other highlight rules so they aren't overridden

" solarized.vim has its own whitespace highlight rule, which we override here
hi TrailingWhitespace ctermbg=red ctermfg=black
match TrailingWhitespace /\s\+$/

set cursorline
execute "set colorcolumn=" . join(range(81,355), ',')
""" match ErrorMsg '\%>80v.\+'  """ Highlight all characters past 80 columns

" }}}

" {{{ Buffer bindings
map <f2> :bprevious<CR>
map <f3> :bnext<CR>
map <f4> :bdelete<CR>
" }}}

" {{{ Views and Folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
" }}}

" Use a mark to preserve cursor position when joining lines
nnoremap J mzJ`z

" .sh files should use bash syntax highlighting, not ksh
if has("eval")
  let is_bash=1
endif

" sudo write with :w!!
cmap w!! w !sudo tee > /dev/null %

" {{{ AlternativeFacts.vim
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
" }}}

" {{{ Toggle syntax highlighting with F1

function! NerfladSyntax()
    if &syntax == "off"
        execute "set syntax=on"
    elseif &syntax != "off"
        execute "set syntax=off"
    endif
endfunction

noremap <F1> :call NerfladSyntax()<CR>

" }}}


" {{{ CREDITS
" A lot of stuff from the default Debian, Arch and Gentoo vimrc's
" vim.wikia.com/wiki/Vim_Tips_Wiki
" https://sanctum.geek.nz/arabesque/vim-search-highlighting/
" https://sanctum.geek.nz/arabesque/vim-annoyances/
" https://blog.hanschen.org/2012/10/24/different-background-color-in-vim-past-80-columns/
" }}}

" vim: set fenc=utf-8 tw=80 foldmethod=marker :
