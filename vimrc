" Basic Settings
set nocompatible
syntax on
filetype on
filetype plugin indent on
set nowrap
set relativenumber
set history=1000
set backspace=indent,eol,start
set list
set listchars=trail:⋅,nbsp:⋅
set hidden
set timeoutlen=1000 ttimeoutlen=10

" Cmd Line Tab Completion
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" Indentation Settings
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Folding Settings
set nofoldenable
set foldmethod=indent
set foldnestmax=3
set foldlevel=1

" Search Settings
set ignorecase
set smartcase
set incsearch
set hlsearch

" ColorScheme
set background=dark
colorscheme solarized

" Enable Pathogen
execute pathogen#infect()

" Extra Customizations
let mapleader=","

" Plugin Customizations
"" AirLine
set laststatus=2
set showcmd
set noshowmode
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0

" Maps
map <silent> <Leader><Leader> :nohlsearch<cr> " remove search hl
nmap <silent> <leader>w m`:%s/\s\+$//e<cr>``:noh<cr> " fix whitespace

