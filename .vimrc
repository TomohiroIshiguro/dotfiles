set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis,euc-jp

set belloff=all

"------------------------------
" 表示
"------------------------------

filetype on
syntax on
set nu
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

"------------------------------
" 画面操作
"------------------------------

filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2

set clipboard=unnamed

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
"Plugin 'w0rp/ale'
"Plugin 'neoclide/coc.nvim'
"Plugin 'dart-lang/dart-vim-plugin'
"Plugin 'thosakwe/vim-flutter'

call vundle#end()

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

"" w0rp/ale
"" 保存時のみ実行する
"let g:ale_lint_on_text_changed = 0
"let g:ale_fix_on_save = 1
"" 表示に関する設定
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
"let g:airline#extensions#ale#open_lnum_symbol = '('
"let g:airline#extensions#ale#close_lnum_symbol = ')'
"let g:ale_echo_msg_format = '[%linter%]%code: %%s'
"highlight link ALEErrorSign Tag
"highlight link ALEWarningSign StorageClass
"" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
"
"let g:ale_linters = {
"      \ 'javascript': ['eslint'],
"      \ }
"let g:ale_fixers = {
"      \ 'javascript': ['prettier'],
"      \ }
"
"" coc-nvim
"imap <C-;> <Plug>(coc-snippets-expand)
"vmap <C-j> <Plug>(coc-snippets-select)
"let g:coc_snippet_next = '<c-j>'
"let g:coc_snippet_prev = '<c-k>'
"imap <C-j> <Plug>(coc-snippets-expand-jump)
"
"" dart-vim-plugins
"let g:dart_format_on_save = 1
"let g:flutter_hot_reload_on_save = 1
