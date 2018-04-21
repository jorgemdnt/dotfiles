filetype plugin indent on

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

set autowrite
set updatetime=500
set number
set clipboard+=unnamedplus
set noswapfile
set ignorecase
set infercase

set tabstop=4
set softtabstop=4
set shiftwidth=4
set fileformat=unix
set expandtab
set smarttab
set autoindent
set smartindent

set termguicolors
colorscheme base16-atelierheath
set background=dark

function! ToggleBackground()
    if &background == 'dark'
        set background=light
    else
        set background=dark
    endif
endfunction

let g:mapleader = ' '

nnoremap ; :
nnoremap <leader>w :wa<CR>
nnoremap <leader>x :wqa<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>bl :buffers<CR>
nnoremap <leader>bb :buffer *
nnoremap <leader>bd :bdelete<CR>
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
nnoremap <bs> <c-^>

vmap < <gv
vmap > >gv

nnoremap <leader><space> :nohlsearch<CR>

noremap <F5> :call ToggleBackground()<CR>

set nospell spelllang=en_us,pt_br
autocmd BufNewFile,BufRead *.md set spell

let @e = 'ygv"=+p' " Calculate visual selection

augroup OpenQuickfixAfterGrep
    autocmd!
    autocmd QuickFixCmdPost [^l]* copen
    autocmd QuickFixCmdPost l*    lopen
augroup END 

augroup FiletypeSettings
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    au BufNewFile,BufRead *.py set textwidth=79

    au BufNewFile,BufRead *.{html,css,py}
                \ set tabstop=4 |
                \ set softtabstop=4 |
                \ set shiftwidth=4 |

    au BufNewFile,BufRead *.{js,jsx,rb,hs,md}
                \ set tabstop=2 |
                \ set softtabstop=2 |
                \ set shiftwidth=2 |

    au BufNewFile,BufRead *.rb set colorcolumn=100
augroup END

nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fa :Ag<space>
nnoremap <Leader>fz :Ag<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fc :Commands<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
