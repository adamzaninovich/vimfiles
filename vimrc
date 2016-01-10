" This is Adam Zaninovich's vimrc file.

autocmd!

" Enable Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'rking/ag.vim'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'
" Ruby and Rails
Plugin 'adamzaninovich/vim-spec_runner'
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'
" Elixir and Phoenix
Plugin 'elixir-lang/vim-elixir'
Plugin 'adamzaninovich/vim-exunit_runner'
Plugin 'avdgaag/vim-phoenix'
" Javascript
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mtscout6/vim-cjsx'
" Swift
Plugin 'keith/swift.vim'
" Clojure
" Plugin 'guns/vim-clojure-static'
" Plugin 'tpope/vim-fireplace'
" Plugin 'kien/rainbow_parentheses.vim'
" GNU Smalltalk
Plugin 'vim-scripts/st.vim'
""""""" Markdown
" Use fenced code blocks in markdown
Plugin 'jtratner/vim-flavored-markdown'
  let g:markdown_fenced_languages=['ruby', 'javascript', 'elixir', 'clojure', 'sh', 'html', 'sass', 'scss', 'haml', 'erlang']
" Markdown is now included in vim, but by default .md is read as Modula-2
" files.  This fixes that, because I don't ever edit Modula-2 files :)
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set tw=80

""""" UI Plugins =======================
Plugin 'bling/vim-airline'       " UI statusbar niceties
  set laststatus=2               " enable airline even if no splits
  set showcmd
  let g:airline_theme='luna'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#branch#enabled = 1
  let g:airline_symbols = {}
  let g:airline_symbols.branch = '⎇ '
  let g:airline_symbols.paste = 'ρ'
  let g:airline#extensions#tabline#enabled = 0 " set 1 for buffer line
  let g:bufferline_echo = 0
  let g:airline_mode_map = {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'REPLACE',
        \ 'v' : 'VISUAL',
        \ 'V' : 'V-LINE',
        \ 'c' : 'CMD   ',
        \ '': 'V-BLCK',
        \ }

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
set history=10000
filetype off
syntax on
set nowrap
set relativenumber
set number
set backspace=indent,eol,start
set list
set listchars=trail:⋅,nbsp:⋅
set timeoutlen=1000 ttimeoutlen=10
set cursorline
set cmdheight=1
set switchbuf=useopen
set winwidth=80
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
set wrapscan

" Path
set path+=**

" ColorScheme
set background=dark
colorscheme solarized

" Change cursor in iTerm2
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Extra Customizations
let mapleader=","

" Plugin Customizations

"" AirLine
" set laststatus=2
" set showcmd
" set noshowmode
" let g:airline_powerline_fonts = 1

"" CtrlP
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

call ctrlp_bdelete#init()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Local variable to let
nmap <leader>l 0wilet(:f=hvlc) {A }

" CtrlP buffer
nnoremap <leader>b :CtrlPBuffer<cr>

" convert stupid 18 syntax
map <leader>19 :%s/:\(\w*\) \?=> \?/\1: /gci<cr>
map <leader>19! :%s/:\(\w*\) \?=> \?/\1: /gi<cr>

" search with Ag
noremap <leader>a :Ag<space>

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

" Run elixir tests with mix test
" autocmd FileType elixir map <buffer> <leader>t :!mix test<cr>
" autocmd FileType elixir map <buffer> <leader>f :!mix test %<cr>
" autocmd FileType elixir map <buffer> <leader>c :!elixirc % && iex<cr>

" Run Specs on this line. Repeatable outside of spec
autocmd FileType elixir map <buffer> <leader>t :call exunit_runner#Runline()<cr>
" Run the current spec file. Repeatable outside of spec
autocmd FileType elixir map <buffer> <leader>f :call exunit_runner#Runfile()<cr>
" Run the entire suite of specs
autocmd FileType elixir map <buffer> <leader>T :call exunit_runner#Run('test')<cr>
" Repeat whatever was last run
autocmd FileType elixir map <buffer> <leader>r :call exunit_runner#Repeat()<cr>

" Run Specs on this line. Repeatable outside of spec
autocmd FileType ruby map <buffer> <leader>t :call spec_runner#Runline()<cr>
" Run the current spec file. Repeatable outside of spec
autocmd FileType ruby map <buffer> <leader>f :call spec_runner#Runfile()<cr>
" Run the entire suite of specs
autocmd FileType ruby map <buffer> <leader>T :call spec_runner#Run('spec')<cr>
" Repeat whatever was last run
autocmd FileType ruby map <buffer> <leader>r :call spec_runner#Repeat()<cr>

"""""""""""""""""""""""""
" Flashing a Spark Core "
"""""""""""""""""""""""""

" function! FlashSparkCore()
"   execute("w")
"   execute("!curl -X PUT -F file=@" . expand("%p") . " https://api.spark.io/v1/devices/48ff6e065067555031182387?access_token=8d3859cff1650c6a28dbfb8d2eea17070aff07c6")
" endfunction
" map <leader>fff :call FlashSparkCore() <cr>
" command! FlashSparkCore call FlashSparkCore()

command! Reload execute("source ~/.vimrc")

set exrc
set secure
