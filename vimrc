" This is Adam Zaninovich's vimrc file.

autocmd!

" Enable Vundle
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'jnwhiteh/vim-golang'
Plugin 'tpope/vim-rails'
Plugin 'adamzaninovich/vim-spec_runner'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
set history=10000
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
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
map <leader>t :call spec_runner#Runline()<cr>
" Run the current spec file. Repeatable outside of spec
map <leader>f :call spec_runner#Runfile()<cr>
" Run the entire suite of specs
map <leader>T :call spec_runner#Run('spec')<cr>
" Repeat whatever was last run
map <leader>r :call spec_runner#Repeat()<cr>

"""""""""""""""""""""""""
" Flashing a Spark Core "
"""""""""""""""""""""""""

function! FlashSparkCore()
  execute("w")
  execute("!curl -X PUT -F file=@" . expand("%p") . " https://api.spark.io/v1/devices/48ff6e065067555031182387?access_token=8d3859cff1650c6a28dbfb8d2eea17070aff07c6")
endfunction
" map <leader>fff :call FlashSparkCore() <cr>
command! FlashSparkCore call FlashSparkCore()

