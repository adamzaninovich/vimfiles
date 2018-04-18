" This is Adam Zaninovich's init.vim file.

autocmd!

set nocompatible
filetype off
call plug#begin('~/.config/nvim/plugged')

" Can't live without
Plug 'janko-m/vim-test'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'

" Extra nice
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'd11wtq/ctrlp_bdelete.vim'

" Ruby and Rails
" Plug 'tpope/vim-rails'
" Plug 'kchmck/vim-coffee-script'

" Elixir and Phoenix
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix', { 'for': 'elixir' }
Plug 'powerman/vim-plugin-AnsiEsc' | Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

" Javascript
Plug 'elzr/vim-json', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'mxw/vim-jsx', { 'for': 'javascript' }
" Plug 'mtscout6/vim-cjsx', { 'for': 'javascript' }

" Swift
" Plug 'keith/swift.vim', { 'for': 'swift' }

" Clojure
" Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }

" GNU Smalltalk
" Plug 'vim-scripts/st.vim', { 'for': 'smalltalk' }

" Markdown
" Plug 'jtratner/vim-flavored-markdown', { 'for': 'markdown' }

" UI Plugins
Plug 'itchyny/lightline.vim'

call plug#end()
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
set colorcolumn=80
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
colorscheme gruvbox

" Spelling
autocmd FileType markdown set spell
autocmd FileType markdown set spell spelllang=en_us
autocmd FileType markdown set complete+=kspell
autocmd FileType gitcommit set spell
autocmd FileType gitcommit set spell spelllang=en_us
autocmd FileType gitcommit set complete+=kspell

" Extra Customizations
let mapleader=","

" Plugin Customizations

"" Lightline
set laststatus=2 " enable lightline even if no splits
set showcmd
let g:lightline = { 'colorscheme': 'gruvbox' }

"" CtrlP
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

call ctrlp_bdelete#init()


" Use fenced code blocks in markdown
let g:markdown_fenced_languages=['ruby', 'javascript', 'clojure', 'sh', 'html', 'sass', 'scss', 'haml', 'erlang']
" Markdown is now included in vim, but by default .md is read as Modula-2
" files.  This fixes that, because I don't ever edit Modula-2 files :)
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set tw=80


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Local variable to let
" nmap <leader>l 0wilet(:f=hvlc) {A }

" CtrlP buffer
nnoremap <leader>b :CtrlPBuffer<cr>

" convert stupid 18 syntax
map <leader>19 :%s/:\(\w*\)\s*=>\s*/\1: /gci<cr>
map <leader>19! :%s/:\(\w*\)\s*=>\s*/\1: /gi<cr>

" search with Ag
noremap <leader>a :Ag<space>

" no-op fucking Q
nmap Q <nop>

" quit all other splits
nmap <silent> <leader>q :only<cr>

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

map <silent> <leader>t :TestNearest<CR>
map <silent> <leader>f :TestFile<CR>
map <silent> <leader>T :TestSuite<CR>
map <silent> <leader>r :TestLast<CR>
map <silent> <leader>g :TestVisit<CR>

"" neovim-specific config
if has("nvim")
  let $SIMPLE_PROMPT=1

  " change cursor to bar in insert mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  " enable deoplete completion for elixir
  " autocmd FileType elixir inoremap <silent><expr> <C-p> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

  " fuck mouse support, what am I a vimposer?
  set mouse-=a

  " run tests with :T
  let test#strategy="neoterm"

  " vertical split instead of the default horizontal
  let g:neoterm_position="vertical"

  nnoremap <silent> <leader>c :Tclose<cr>

  " pretty much essential: by default in terminal mode, you have to press ctrl-\-n to get into normal mode
  " ain't nobody got time for that
  tnoremap <Esc> <C-\><C-n>

  " optional: make it easier to switch between terminal splits
  " ctrl doesn't work for some reason so I use alt
  " I think the terminal is capturing ctrl and not bubbling to vim or something
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l

  " totally optional: mirror the alt split switching in non-terminal splits
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
endif

set exrc
set secure
