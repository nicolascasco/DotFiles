syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set autowrite
set smarttab
set expandtab
set smartindent
set nowrap
set cursorline
set smartcase
set nohlsearch
set incsearch
set ignorecase
set noshowmatch
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set hidden
set termguicolors
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set colorcolumn=80
highlight colorcolumn ctermbg=0 guibg=lightgrey
set guicursor=
set list listchars=tab:»·,trail:·,nbsp:·

set number relativenumber

:augroup numbertoggle                                                                                                                                                 1 :  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber "En modo insert se deactivan los numeros relativos
:augroup END

" give more space for displaying messages.
set cmdheight=2

" having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" don't pass messages to |ins-completion-menu|.
set shortmess+=c

" plugins
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox
set background=dark
set t_ut=""

let mapleader = " "

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/','git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_browser_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

" Quicker window movement
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap <leader>u :Undotreeshow<cr>
nnoremap <Leader>ps :Rg <c-r><c-w><CR>

" get off my lawn
nnoremap <left> :echoe "use h"<cr>
nnoremap <right> :echoe "use l"<cr>
nnoremap <up> :echoe "use k"<cr>
nnoremap <down> :echoe "use j"<cr>

let g:html_indent_tags = 'li\|p'

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"NERDTree
map <C-n> :NERDTreeToggle<CR>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

"noremap <Esc>j :m+1<CR>
"noremap <Esc>k :m-2<CR>

" GoTo Code Navigation
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-reference)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)

nnoremap <leader>cr :CocRestart

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
