nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
inoremap jk <esc>
nnoremap ; :
vnoremap ; :
nnoremap <CR> G

set number
set hlsearch
set incsearch
set pastetoggle=<F2>

set ignorecase
set smartcase

set expandtab
set shiftwidth=4
set softtabstop=4

syntax on
set smartindent

set encoding=utf-8
set t_Co=256 " enable 256 colors in vim

let mapleader=","

" Filetype handling
au BufRead,BufNewFile *.bteq,*.btq set filetype=sql
au BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Use pathogen to pull in vim plug-ins
execute pathogen#infect()

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0  
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1 
let NERDTreeIgnore = ['\.pyc$']

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Set colorscheme
colorscheme badwolf
let badwolf_darkgutter = 1

