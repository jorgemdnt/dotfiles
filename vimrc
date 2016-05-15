set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256
let g:solarized_termcolors=256
set background=light
set number
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

autocmd! bufwritepost .vimrc source %

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call undle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tmhedberg/SimpylFold'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround' 
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on    " required

syntax enable on
colorscheme solarized
let mapleader = ","
set cursorline
set wildmenu
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
" Powerline setup
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set guifont=Ubuntu\ Mono\ derivative\ Powerline
set laststatus=2

" Silver SEarcher
nnoremap <leader>a :Ag

set pastetoggle=<F8>
set clipboard=unnamed

set foldmethod=indent
set foldlevel=129
"NERDTREE
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>
"autoform
noremap <F4> :Autoformat<CR>
" Python-mode
" " Activate rope
" Keys:
" " K             Show python docs
" " <Ctrl-Space>  Rope autocomplete
" " <Ctrl-c>g     Rope goto definition
" " <Ctrl-c>d     Rope show documentation
" " <Ctrl-c>f     Rope find occurrences
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" " [[            Jump on previous class or function (normal, visual, operator
" modes)
" " ]]            Jump on next class or function (normal, visual, operator
" modes)
" " [M            Jump on previous class or method (normal, visual, operator
" modes)
" " ]M            Jump on next class or method (normal, visual, operator
" modes)
let g:pymode_rope = 1
" " Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"
" "Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "W0611,W0612,E501,W391"

" " Auto check on save
let g:pymode_lint_write = 0
"
" " Support virtualenv
let g:pymode_virtualenv = 1
"
" " Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
"
" " syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'django']
"
" " Don't autofold code
let g:pymode_folding = 0
"
" " Procurar ropeproject
let g:pymode_rope_lookup_project = 1

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

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

set encoding=utf-8

let NERDTreeIgnore = ['\.pyc$']
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

" CtrlP
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

set fileformats=unix
