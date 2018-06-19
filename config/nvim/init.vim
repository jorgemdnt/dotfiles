filetype plugin indent on

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'alcesleo/vim-uppercase-sql'
Plug 'chriskempson/base16-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'honza/vim-snippets'
Plug 'inside/vim-grep-operator'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'

call plug#end()

set autowrite
set updatetime=500
set number
set clipboard+=unnamedplus
set noswapfile
set ignorecase
set infercase
set gdefault

set tabstop=8
set softtabstop=4
set shiftwidth=4
set fileformat=unix
set expandtab
set smarttab
set autoindent
set hidden
" Enable project specific .nvimrc/.exrc
set exrc
set mouse=a

" Better gf command
set path+=**
set suffixesadd=.js,.rb

set termguicolors
colorscheme base16-onedark
set background=dark

set undofile
set undodir=~/.config/nvim/undodir

function! ToggleBackground()
    if &background == 'dark'
        set background=light
    else
        set background=dark
    endif
endfunction

let g:mapleader = ' '

nnoremap <leader>w :echoerr "Use ':w'!!!"<CR>
nnoremap <leader>x :echoerr "Use ':x'!!!"<CR>
nnoremap <leader>q :echoerr "Use ':q'!!!"<CR>

nnoremap <leader><space> :Buffers<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <bs> <c-^>
inoremap jk <Esc>

vmap < <gv
vmap > >gv

nnoremap <leader>n :nohlsearch<CR>

noremap <F5> :call ToggleBackground()<CR>

nnoremap <Leader>ev :e $MYVIMRC<CR>

augroup AutoSourceVimrc
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
augroup END

set nospell spelllang=en_us,pt_br
autocmd BufNewFile,BufRead *.md setlocal spell

let @e = 'ygv"=+p' " Calculate visual selection

nnoremap c* *Ncgn
nnoremap c# #NcgN

set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

augroup OpenQuickfixAfterGrep
    autocmd!
    autocmd QuickFixCmdPost [^l]* copen
    autocmd QuickFixCmdPost l*    lopen
augroup END

augroup FiletypeSettings
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*}
                \ set filetype=markdown |

    au BufNewFile,BufRead *.py set textwidth=79

    au BufNewFile,BufRead *.go set noexpandtab

    au BufNewFile,BufRead *.{js,jsx,rb,hs,md,yml,html,scss,css}
                \ set softtabstop=2 |
                \ set shiftwidth=2 |

    au BufNewFile,BufRead *.rb setlocal colorcolumn=100
augroup END

nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fa :grep<space>
nnoremap <Leader>fz :Ag<space>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fc :Commands<CR>

command! -nargs=+ -complete=shellcmd RunCommandOnTerminal belowright 10split term://<args>
nnoremap <Leader>rt :RunCommandOnTerminal rd-docker exec web rspec %<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:deoplete#enable_at_startup = 1

nnoremap <F2> :Vexplore<CR>
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

if executable('grip')
    noremap <silent> <leader>om :call OpenMarkdownPreview()<cr>

    function! OpenMarkdownPreview() abort
      if exists('s:markdown_job_id') && s:markdown_job_id > 0
        call jobstop(s:markdown_job_id)
        unlet s:markdown_job_id
      endif
      let s:markdown_job_id = jobstart(
        \ 'grip -b ' . shellescape(expand('%:p')) . " 0 2>&1 | awk '/Running/ { printf $4 }'"
        \)
    endfunction
endif

nnoremap <Leader>cs :%s/\<<C-r><C-w>\>/
vnoremap <Leader>cs y:%s/<c-r>"/

set showbreak=↪\
set listchars=tab:»\ ,eol:↲,extends:›,precedes:‹,nbsp:•,trail:·
set list

let g:UltiSnipsExpandTrigger='<C-a>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'haskell', 'java']

let g:gutentags_ctags_executable = 'uctags'
let g:fzf_tags_command = 'uctags -R'

nmap gr <Plug>GrepOperatorOnCurrentDirectory
vmap gr <Plug>GrepOperatorOnCurrentDirectory
nmap gR <Plug>GrepOperatorWithFilenamePrompt
vmap gR <Plug>GrepOperatorWithFilenamePrompt

tnoremap <Esc> <C-\><C-n>

au FocusLost * silent! wa
