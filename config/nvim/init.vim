filetype off
syntax on
set number
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE


call plug#begin('~/.local/share/nvim/plugged')

Plug 'flazz/vim-colorschemes'
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
Plug 'Raimondi/delimitMate'
Plug 'ternjs/tern_for_vim' " cd ~/.config/nvim/bundle/tern_for_vim && npm install
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
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
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'ryanoasis/vim-devicons'
Plug 'alx741/vim-hindent'
Plug 'tpope/vim-vinegar'

call plug#end()
filetype plugin indent on

colorscheme apprentice
set wildmenu
set wildignore+=*/node_modules/**,*/__pycache__/**,*/.idea/**
set incsearch
set hlsearch

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

set nobackup
set noswapfile

set pastetoggle=<F8>

nnoremap <F5> :set background=light<CR>
nnoremap <F6> :set background=dark<CR>
inoremap <F5> <ESC>:set background=light<CR>a
inoremap <F6> <ESC>:set background=dark<CR>a
vnoremap <F5> <ESC>:set background=light<CR>
vnoremap <F6> <ESC>:set background=dark<CR>

let g:mapleader = ' '

nnoremap <leader>w :wa<CR>
nnoremap <leader>x :wqa<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader><space> :nohlsearch<CR>

noremap <F4> :Autoformat<CR>

if !has('nvim')
    set ttymouse=xterm2
endif

au BufNewFile,BufRead *.py
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set textwidth=79 |

au BufNewFile,BufRead *.html,*.css
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |

au BufNewFile,BufRead *.js,*.jsx,*.rb,*.hs,*.md
        \ set tabstop=2 |
        \ set softtabstop=2 |
        \ set shiftwidth=2 |

runtime macros/matchit.vim

set ignorecase
set infercase

noremap <leader>l :lopen<cr>

vmap < <gv
vmap > >gv

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':t'

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

noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gh :Gpush<CR>
noremap <Leader>gl :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv

let g:jsx_ext_required = 0

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\   'ruby': ['rubocop'],
\}
let g:ale_fixers = {
\   'javascript': [
\       'eslint',
\   ],
\}

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>bd :bdelete<cr>
nnoremap <C-L> :bn<cr>
nnoremap <C-H> :bp<cr>

nmap <F7> :TagbarToggle<CR>

let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 1
let g:python_highlight_all = 1

set nowrap
set formatoptions-=t

set updatetime=250
set autoread
set autowriteall

let g:UltiSnipsExpandTrigger='<C-a>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
vnoremap <Leader>s y:%s/<c-r>"/
let g:ropevim_autoimport_modules = ['os', 'shutil', 'django.*', 'decimal.*', 'functools.*', 'itertools.*', 'mock.*']
let g:deoplete#enable_at_startup = 1

set tags=./tags;

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

nnoremap ; :
vnoremap ; :

nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fa :Ag<space>
nnoremap <Leader>fz :Ag<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fc :Commands<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:test#python#runner = 'pytest'
let g:test#strategy = 'neovim'

nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>ts :TestSuite<CR>

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

augroup filetype_clojure
    autocmd!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
augroup END

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['white',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['red',         'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ]

let g:airline_powerline_fonts = 0
let g:tmuxline_powerline_separators = 0

set clipboard=unnamedplus

let g:go_fmt_command = "goimports"

autocmd FileType markdown call MarkdownConfig()

function MarkdownConfig()
    set wrap
    set linebreak
endfunction

augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

nnoremap <bs> <c-^>

imap jk <esc>

set undofile
set undodir=~/.config/nvim/undodir

set hid

nnoremap <Leader>u :GundoToggle<CR>

nnoremap <Leader>n :Vexplore<CR>
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
