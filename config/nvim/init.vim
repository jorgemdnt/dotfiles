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
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux'
Plug 'Chun-Yang/vim-action-ag'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'neovimhaskell/haskell-vim'
Plug 'vim-scripts/CSApprox'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-dispatch'
Plug 'ternjs/tern_for_vim' " cd ~/.config/nvim/bundle/tern_for_vim && sudo npm install -g
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'davidhalter/jedi-vim'
Plug 'hdima/python-syntax'
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'python-rope/ropevim' " cd ..bundle/ropevim/ && python setup.py install
Plug 'edkolev/tmuxline.vim'
Plug 'mileszs/ack.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'

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

let mapleader = ","

" Silver SEarcher
nnoremap <leader>a :Ack<space>

" Atalhos para salvar, salvarsair, sair
nnoremap <leader>w :w<CR>
nnoremap <leader>x :wq<CR>
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
    set encoding=utf-8
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

let NERDTreeIgnore = ['\.pyc$', '__pycache__$', 'node_modules']
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|pyc))$'
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" busca insensitive
set ignorecase
set infercase

autocmd! BufWritePost,BufAdd * Neomake

noremap <leader>l :lopen<cr>

vmap < <gv
vmap > >gv

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" Abreviacoes que melhoram a qualidade de vida
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
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Copia pro clipboard no ubuntu
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" Mover bloco visual
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'

let g:jsx_ext_required = 0

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

noremap <Leader>jb :Dispatch! webpack.js -d<CR>
noremap <Leader>jt :VimuxRunCommand("npm test")<CR>

let g:neomake_python_pylama_maker = {'args': ['--ignore=E501']}
let g:neomake_python_flake8_maker = {'args': ['--ignore=E501']}
let g:neomake_python_enabled_makers = ['flake8']

let g:user_emmet_leader_key= '<C-Z>'
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bn<cr>

nmap <F7> :TagbarToggle<CR>

let g:jedi#completions_enabled = 0
let python_highlight_all = 1

" Desabilitar autowrapping
set nowrap
set formatoptions-=t

" Desabilitar autocomplete on type quando multiplecursor ativo devido a
" lentidão
"function! Multiple_cursors_before()
    "let s:old_ycm_whitelist = g:ycm_filetype_whitelist
    "let g:ycm_filetype_whitelist = {}
    "call youcompleteme#DisableCursorMovedAutocommands()
"endfunction

"function! Multiple_cursors_after()
    "let g:ycm_filetype_whitelist = s:old_ycm_whitelist
    "call youcompleteme#EnableCursorMovedAutocommands()
"endfunction


set updatetime=250
set autoread
au FocusLost * :wa
set autowriteall

let g:UltiSnipsExpandTrigger="<C-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
vnoremap <Leader>s y:%s/<c-r>"/
let g:ropevim_autoimport_modules = ["os", "shutil", "django.*", "decimal.*", 'functools.*', 'itertools.*', 'mock.*']
let g:deoplete#enable_at_startup = 1

let g:ctrlp_by_filename = 1

set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_auto_highlight = 0
