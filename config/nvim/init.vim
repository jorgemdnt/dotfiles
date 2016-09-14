filetype off
syntax on
set ruler
set number
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE


call plug#begin('~/.vim/bundle')

Plug 'VundleVim/Vundle.vim'
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'neovimhaskell/haskell-vim'
Plug 'davidhalter/jedi-vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/CSApprox'
Plug 'amirh/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs'
Plug 'tpope/vim-dispatch'

call plug#end()
filetype plugin indent on

set background=dark
colorscheme gruvbox
set cursorline
set wildmenu
set incsearch
set hlsearch
set laststatus=2

" Copy/Paste/Cut
set clipboard=unnamed
set nocursorline
set norelativenumber
set foldmethod=indent
set foldlevel=129

set listchars=tab:▸\ ,eol:¬,space:·
set list

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

set exrc

set fileformats=unix

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

let g:airline_powerline_fonts = 1

" Silver SEarcher
nnoremap <leader>a :Ag<space>

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

let g:pymode_rope = 0
let g:pymode_virtualenv = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" Fuck this, use Neomake
let g:pymode_lint = 0
let g:pymode_lint_write = 0
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" " syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
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

runtime macros/matchit.vim

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let NERDTreeIgnore = ['\.pyc$', '__pycache__$']
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

autocmd! BufWritePost * Neomake

noremap <leader>l :lopen<cr>

vmap < <gv
vmap > >gv

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
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

let g:easytags_async = 1
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0
noremap <Leader>et :UpdateTags -R .<CR>

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'

let g:neomake_javascript_enabled_makers = ['eslint']
let g:jsx_ext_required = 0

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

noremap <Leader>wb :Dispatch ./node_modules/webpack/bin/webpack.js -d<CR>
