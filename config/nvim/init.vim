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
Plug 'junegunn/goyo.vim'
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

nnoremap <leader>w :w<CR>
nnoremap <leader>x :wqa<CR>
nnoremap <leader>q :q<CR>

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

    au BufNewFile,BufRead *.{html,css,py}
                \ set softtabstop=4 |
                \ set shiftwidth=4 |

    au BufNewFile,BufRead *.{js,jsx,rb,hs,md,yml}
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

nnoremap <F3> :Goyo<CR>

function! s:goyo_enter()
  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>cs :%s/\<<C-r><C-w>\>/
vnoremap <Leader>cs y:%s/<c-r>"/
nnoremap <Leader>cg :grep <C-r><C-w><CR>
vnoremap <Leader>cg y:grep /<c-r>"/<CR>

set showbreak=↪\
set listchars=tab:»\ ,eol:↲,extends:›,precedes:‹,nbsp:•,trail:·
set list

let g:UltiSnipsExpandTrigger='<C-a>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

let g:autosessions = 0

function! ToggleAutoSessions()
    let g:autosessions = !g:autosessions
endfunction

function! MakeSession()
  if g:sessionfile != "" && g:autosessions
    echo "Saving."
    if (filewritable(g:sessiondir) != 2)
      exe 'silent !mkdir -p ' g:sessiondir
      redraw!
    endif
    exe "mksession! " . g:sessionfile
  endif
endfunction

function! LoadSession()
  if argc() == 0 && g:autosessions
    let g:sessiondir = $HOME . "/.config/nvim/sessions" . getcwd()
    let g:sessionfile = g:sessiondir . "/session.vim"
    if (filereadable(g:sessionfile))
      exe 'source ' g:sessionfile
    else
      echo "No session loaded."
    endif
  else
    let g:sessionfile = ""
    let g:sessiondir = ""
  endif
endfunction

au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'haskell']
