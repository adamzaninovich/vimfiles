" This is Adam Zaninovich's vimrc file.
" vim:set ts=2 sts=2 sw=2 expandtab:

autocmd!

" Enable Pathogen
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set hidden
set history=10000
syntax on
filetype plugin indent on
set nowrap
set relativenumber
set backspace=indent,eol,start
set list
set listchars=trail:⋅,nbsp:⋅
set timeoutlen=1000 ttimeoutlen=10
set cursorline
set cmdheight=1
set switchbuf=useopen
set winwidth=100
set shell=bash
let g:sh_noisk=1

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Indentation Settings
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Cmd Line Tab Completion
set wildmode=longest,list
set wildmenu
set wildignore=*.o,*.obj,*~

" Folding Settings
set nofoldenable
set foldmethod=indent
set foldnestmax=3
set foldlevel=1

" Search Settings
set ignorecase smartcase
set incsearch
set hlsearch
set showmatch

" ColorScheme
set background=dark
colorscheme solarized

" Extra Customizations
let mapleader=","

" Plugin Customizations
"" AirLine
set laststatus=2
set showcmd
set noshowmode
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" no-op fucking Q
nmap Q <nop>

" remove search hl
map <silent> <leader>l :nohlsearch<cr>
" fix whitespace
nmap <silent> <leader>w m`:%s/\s\+$//e<cr>``:noh<cr>
" easy buffer switching
nnoremap <leader><leader> <c-^>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Run Specs on this line. Repeatable outside of spec
map <leader>t :call spec_runner#run_line()<cr>
" Run the current spec file. Repeatable outside of spec
map <leader>f :call spec_runner#run_file()<cr>
" Run the entire suite of specs
map <leader>T :call spec_runner#run('spec')<cr>
" Repeat whatever was last run
map <leader>r :call spec_runner#repeat()<cr>
