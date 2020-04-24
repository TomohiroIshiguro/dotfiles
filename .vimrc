set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set expandtab
set nu

"------------------------------
" 表示

filetype on
syntax on
let loaded_matchparen = 1

function! NumberToggle()
  if(&rnu == 1)
    set nornu
    set nocursorline
  else
    set rnu
    set cursorline
  endif
endfunc
nnoremap <C-l> :call NumberToggle()<cr>

set pumheight=10

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"------------------------------
" 検索設定
"------------------------------
set ignorecase
set smartcase
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>


"------------------------------
" Vundle - manage plugins
"------------------------------
set rtp+=~/dotfiles/.vim/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- format: Plugin '[Github Author]/[Github repo]'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

" --- settings of plugins 
" scrooloose/nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeShowHidden=1
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" vim-airline/vim-airline-themes
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

