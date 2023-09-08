" vim-plug for plugin management
call plug#begin()
" themes
"Plug 'ajmwagar/vim-deus'
"Plug 'sjl/badwolf'
"Plug 'mhinz/vim-janah'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" filetree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" language-specific
Plug 'fatih/vim-go'
Plug 'buoto/gotests-vim', {'commit': '9adb78b15d0cbb72a3ffb9fbed28faa909b0817b'} " Ref: https://github.com/buoto/gotests-vim/issues/9
Plug 'hashivim/vim-terraform'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" general
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'

" always need to be last
Plug 'ryanoasis/vim-devicons'
call plug#end()

inoremap jk <esc>
nnoremap ; :
vnoremap ; :
nnoremap <CR> G
nnoremap <silent> ,<space> :nohlsearch<CR>
nnoremap ,jq :%!jq<CR>

" Shorten update time to 400ms (default: 4s)
set updatetime=400

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
filetype plugin on
au BufRead,BufNewFile *.bteq,*.btq set filetype=sql
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.html set filetype=htmldjango
au BufRead,BufNewFile Jenkinsfile set filetype=groovy
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType groovy setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']
" NERDTree syntax highlighting
let s:blue = "689FB6"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['go'] = s:blue " sets the color of go files to blue

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" CTRLp
let g:ctrlp_map = '<c-p>'

" vim-go
" Sourced from: https://github.com/fatih/vim-go-tutorial/blob/master/vimrc
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_def_mode = "gopls"
let g:go_info_mode = "gopls"

" Status line types/signatures
let g:go_auto_type_info = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  " override default gd behavior and open :GoDef in a tab
  autocmd FileType go nmap <Leader>gd <Plug>(go-def-tab)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" coc.nvim
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Set colorscheme
colorscheme codedark
let g:airline_theme = 'codedark'

" Adding this which is normally included in /etc/vim/vimrc on
" ubuntu, but for some reason is missing from the global vimrc
" on Mac OSX
"
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" set backspace defaults (required when using a brew installed version of vim
" that doesn't use global defaults)
set backspace=indent,eol,start

" Open NERDTree if vim is opened without files
" http://blogs.perl.org/users/ovid/2011/04/nerdtree-on-startup.html
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
