set encoding=utf-8
scriptencoding utf-8

filetype off
syntax on
set ruler
set number
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE


call plug#begin('~/.local/share/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'Chiel92/vim-autoformat'
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'neovimhaskell/haskell-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'xolox/vim-misc'
Plug 'Raimondi/delimitMate'
Plug 'ternjs/tern_for_vim' " cd ~/.config/nvim/bundle/tern_for_vim && sudo npm install -g
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'python-rope/ropevim' " cd ..bundle/ropevim/ && python setup.py install
Plug 'edkolev/tmuxline.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'
Plug 'tpope/vim-obsession'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/tpope-vim-abolish'
Plug 'Galooshi/vim-import-js'
Plug '5long/pytest-vim-compiler'
Plug 'sjl/gundo.vim'

call plug#end()
filetype plugin indent on

colorscheme Tomorrow-Night
set wildmenu
set wildignore+=*/node_modules/**,*/__pycache__/**,*/.idea/**
set incsearch
set hlsearch
set laststatus=2

" Copy/Paste/Cut
set clipboard=unnamed
set nocursorline
set norelativenumber
set foldmethod=indent
set foldlevel=129

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

set exrc

"" pls no swap
set nobackup
set noswapfile

set pastetoggle=<F8>

nnoremap <F5> :set background=light<CR>
nnoremap <F6> :set background=dark<CR>
inoremap <F5> <ESC>:set background=light<CR>a
inoremap <F6> <ESC>:set background=dark<CR>a
vnoremap <F5> <ESC>:set background=light<CR>
vnoremap <F6> <ESC>:set background=dark<CR>

let g:mapleader = ','

" Atalhos para salvar, salvarsair, sair
nnoremap <leader>w :wa<CR>
nnoremap <leader>x :wqa<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader><space> :nohlsearch<CR>

" Airline
let g:airline_powerline_fonts = 1

"NERDTREE
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>

"autoform
noremap <F4> :Autoformat<CR>

noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

if !has('nvim')
    set ttymouse=xterm2
endif

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

au BufNewFile,BufRead *.js,*.jsx,*.html,*.css
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |

runtime macros/matchit.vim

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let g:NERDTreeIgnore = ['\.pyc$', '__pycache__$', 'node_modules']

" busca insensitive
set ignorecase
set infercase

set listchars=tab:▸\ ,eol:¬,space:·
set list


noremap <leader>l :lopen<cr>

vmap < <gv
vmap > >gv

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gh :Gpush<CR>
noremap <Leader>gl :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Mover bloco visual
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv

let g:jsx_ext_required = 0

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

let g:ale_sign_column_always = 1
highlight clear ALEError
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\}

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

augroup SaveOnFocusLost
    au FocusLost * :wa
augroup END

let g:user_emmet_leader_key= '<C-Z>'
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bn<cr>

nmap <F7> :TagbarToggle<CR>

let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 1
let g:python_highlight_all = 1

" Desabilitar autowrapping
set nowrap
set formatoptions-=t

set updatetime=250
set autoread
set autowriteall

let g:UltiSnipsExpandTrigger='<C-a>'
let g:UltiSnipsJumpForwardTrigger='<C-s>'
let g:UltiSnipsJumpBackwardTrigger='<C-z>'

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
vnoremap <Leader>s y:%s/<c-r>"/
let g:ropevim_autoimport_modules = ['os', 'shutil', 'django.*', 'decimal.*', 'functools.*', 'itertools.*', 'mock.*']
let g:deoplete#enable_at_startup = 1

set tags=./tags;

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

nnoremap ; :

let g:NERDTreeWinSize=60

nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fa :Ag<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fc :Commands<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:test#python#runner = 'pytest'
let g:test#strategy = 'neovim'

nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>ts :TestSuite<CR>
nnoremap <Leader>td :let test#python#runner = 'djangotest'<CR>
nnoremap <Leader>tp :let test#python#runner = 'pytest'<CR>

let g:tagbar_type_javascript = {
    \ 'kinds' : [
        \ 'v:global variables:0:0',
        \ 'c:classes',
        \ 'o:object',
        \ 'p:properties:0:0',
        \ 'm:methods',
        \ 'i:imports',
        \ 'f:functions',
        \ 'a:array',
        \ 'g:generator',
        \ 'e:export',
        \ '?:unknown',
    \ ],
\ }
