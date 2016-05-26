filetype off
set number
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

autocmd! bufwritepost .vimrc source %

call plug#begin('~/.vim/bundle')

Plug 'VundleVim/Vundle.vim'
Plug 'davidhalter/jedi-vim'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'klen/python-mode'
Plug 'Chiel92/vim-autoformat'
Plug 'tmhedberg/SimpylFold'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux'
Plug 'Chun-Yang/vim-action-ag'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'morhetz/gruvbox'

call plug#end()

set background=dark
colorscheme gruvbox

nnoremap <F5> :set background=light<CR>
nnoremap <F6> :set background=dark<CR>
inoremap <F5> <ESC>:set background=light<CR>a
inoremap <F6> <ESC>:set background=dark<CR>a
vnoremap <F5> <ESC>:set background=light<CR>
vnoremap <F6> <ESC>:set background=dark<CR>


let mapleader = ","
set cursorline
set wildmenu
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set guifont=Ubuntu\ Mono\ derivative\ Powerline
set laststatus=2

let g:airline_powerline_fonts = 1

" Silver SEarcher
nnoremap <leader>a :Ag<space>

nnoremap <leader>w :w<CR>
nnoremap <leader>x :wq<CR>
nnoremap <leader>q :q<CR>

" Airline
let g:airline_powerline_fonts = 1

set clipboard=unnamed

set foldmethod=indent
set foldlevel=129
"NERDTREE
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>
"autoform
noremap <F4> :Autoformat<CR>

set pastetoggle=<F8>
let g:pymode_rope = 1
let g:pymode_virtualenv = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_rope_completion_bind = '<C-Space>'
" " Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" "Linting
let g:pymode_lint = 1
nnoremap <leader>l :PymodeLint<cr>
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "W0611,W0612,E501,W391"
" " Auto check on save
let g:pymode_lint_write = 0
" " Support virtualenv
" " Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" " syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 1
" " Don't autofold code
let g:pymode_folding = 0
" " Procurar ropeproject
let g:pymode_rope_lookup_project = 1

noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

if !has('nvim')
    set ttymouse=xterm2
endif

" Enable folding with the spacebar
nnoremap <space> za

set listchars=tab:▸\ ,eol:¬
set list

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

if !has('nvim')
  set encoding=utf-8
endif


let NERDTreeIgnore = ['\.pyc$', '__pycache__$']
runtime macros/matchit.vim

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set rnu
function! ToggleNumbersOn()
	set nu!
	set rnu
endfunction
function! ToggleRelativeOn()
	set rnu!
	set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

hi CursorLineNR cterm=bold


set exrc

set fileformats=unix

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|pyc))$'
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Supertab autocompletar descendente
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:gruvbox_contrast_light="soft"
let g:gruvbox_contrast_dark="soft"

" busca insensitive
set ignorecase
set infercase
