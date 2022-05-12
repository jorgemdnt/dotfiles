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
Plug 'fatih/vim-go'
Plug 'guns/vim-clojure-static'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'honza/vim-snippets'
Plug 'inside/vim-grep-operator'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'leafgarland/typescript-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nikvdp/ejs-syntax'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/CycleColor'

call plug#end()

lua require'nvim-tree'.setup()

set autowrite
set updatetime=100
set number
set clipboard+=unnamedplus
set noswapfile
set ignorecase
set infercase
set gdefault
set magic
set splitbelow
set splitright

syntax on
filetype on
filetype plugin on
filetype plugin indent on
syntax enable


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

set complete+=]
colorscheme base16-embers

set undofile
set undodir=~/.config/nvim/undodir

let g:mapleader = ' '

nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader><space> :Buffers<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <bs> <c-^>
" inoremap <ESC> <nop>

vmap < <gv
vmap > >gv

nnoremap <leader>n :nohlsearch<CR>

nnoremap <Leader>ev :e $MYVIMRC<CR>

set nospell spelllang=en_us,pt_br
autocmd BufNewFile,BufRead *.md setlocal spell

nnoremap c* *Ncgn
nnoremap c# #NcgN

set grepprg=rg\ --hidden\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

augroup OpenQuickfixAfterGrep
	autocmd!
	autocmd QuickFixCmdPost [^l]* copen
	autocmd QuickFixCmdPost l*    lopen
augroup END

augroup FiletypeSettings
	autocmd!
	au BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx
	au BufNewFile,BufRead *.clj setlocal filetype=clojure
	au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*}
		\ set filetype=markdown

	au FileType python set textwidth=79

	au BufNewFile,BufRead,BufEnter *.{vim,go}
		\ setlocal noexpandtab |
		\ setlocal softtabstop=8 |
		\ setlocal shiftwidth=8

        au BufNewFile,BufRead,BufEnter *.{js,ts,tsx,json,jsx,rb,erb,hs,md,yml,html,scss,css,ejs}
		\ setlocal expandtab |
		\ setlocal softtabstop=2 |
		\ setlocal shiftwidth=2 |

	au FileType ruby
		\ setlocal colorcolumn=120
augroup END

nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :GFiles?<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fa :Rg<space>
nnoremap <Leader>fz :Rg<space>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fc :Colors<CR>

command! CopyFileName :let @+ = expand("%:t")
command! CopyFilePath :let @+ = expand("%:p")
command! CopyRelativeFilePath :let @+ = expand("%")
function! WriteInNewDir()
    execute "!mkdir -p %:h"
    execute "w"
endfunction
command! WriteInNewDir :call WriteInNewDir()
function! RmAndRemoveBuffer()
    execute "!rm %"
    execute "bd!"
endfunction
command! Rm :call RmAndRemoveBuffer()

command! -nargs=+ -complete=shellcmd TermCommand belowright split term://<args>
autocmd Filetype ruby set makeprg=rubocop\ --format\ emacs
autocmd FileType ruby command! Prettier !rbprettier --print-width 100 -w %
autocmd FileType ruby nnoremap <Leader>rt :TermCommand bundle exec rspec %<CR>
autocmd FileType ruby nnoremap <Leader>rf :TermCommand ruby %<CR>
autocmd FileType typescriptreact,typescript command! Prettier !yarn run prettier --write %
autocmd FileType typescriptreact,typescript nnoremap <Leader>rp :Prettier<CR>
autocmd FileType typescriptreact,typescript nnoremap <Leader>rt :TermCommand yarn run test %<CR>
autocmd FileType go nnoremap <Leader>rt :GoTest<CR>

command! -range RemoveParamArgs s/\s\w\+\([,)]\)/\1
command! -range KeysToSymbols s/\(\w\+\)\:,\?/:\1,
command! -range ParamsToInstanceAttrs s/\(\w\+\):,/@\1 = \1\r

nnoremap <Leader>t :NvimTreeFindFileToggle<CR>
let g:netrw_keepdir = 0
let g:netrw_ctags = 'ctags'
let g:netrw_sort_by = 'name'

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

nnoremap <Leader>: :Commands<CR>
nnoremap <Leader>ss q:i%s/<c-r>"/
vnoremap <Leader>ss yq:i%s/<c-r>"/

set showbreak=↪\
set listchars=tab:»\ ,eol:↲,extends:›,precedes:‹,nbsp:•,trail:·,space:·
set list

let g:UltiSnipsExpandTrigger='<C-a>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'haskell', 'java', 'sql']

let g:gutentags_ctags_executable = 'ctags'
let g:fzf_tags_command = 'ctags -R'

nmap gr <Plug>GrepOperatorOnCurrentDirectory
vmap gr <Plug>GrepOperatorOnCurrentDirectory
nmap gR <Plug>GrepOperatorWithFilenamePrompt
vmap gR <Plug>GrepOperatorWithFilenamePrompt

tnoremap <Esc> <C-\><C-n>

au FocusLost * silent! wa

let g:gitgutter_map_keys = 0
" au FileChangedShell,BufEnter * GitGutter

au FileWritePost ruby make %
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>ga :Git add .<CR>
nnoremap <Leader>gc :Git commit<CR>

let g:lightline = {
	\ 'colorscheme': 'PaperColor',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'cocstatus', 'readonly', 'filepath', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead',
	\   'filepath': 'FilenameForLightline',
	\   'cocstatus': 'coc#status'
	\ },
	\ }

function! FilenameForLightline()
    return expand('%')
endfunction

augroup AutoFormatAndFixImportsGo
	autocmd!
	au BufWritePre *.go GoFmt
	au BufWritePre *.go GoImports
augroup END

let g:grep_operator_set_search_register = 1

" Unicode options
if has("multi_byte")
    " set the display encoding
    " (default is "", or "utf-8" in the GUI)
    if &termencoding == ""
        " we're probably not using the GUI
        " note: :set won't allow &-replacement
        let &termencoding = &encoding
    endif
    " set the internal encoding
    set encoding=utf-8

    " &fileencoding (controls how characters in the internal encoding will
    " be written to the file) will be set according to &fileencodings
    " (default: "ucs-bom", "ucs-bom,utf-8,default,latin1" when 'encoding'
    "  is set to a Unicode value)
endif " has("multi_byte")

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-solargraph']

" ############## CoC.nvim settings

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" ############## CoC.nvim settings
