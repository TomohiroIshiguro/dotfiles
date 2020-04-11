set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set expandtab

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
Plugin 'w0rp/ale'
Plugin 'neoclide/coc.nvim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'thosakwe/vim-flutter'

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
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = '>>'
let g:airline#extensions#ale#warning_symbol = '--'
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

" suan/vim-instant-markdown
let g:instant_markdown_autostart = 1

" w0rp/ale
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_linters = {
      \ 'html': ['tidy'],
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ }
let g:ale_fixers = {
      \ 'html': ['prettier'],
      \ 'css': ['prettier'],
      \ 'javascript': ['prettier'],
      \ }
let g:ale_fix_on_save = 1

" coc-nvim
imap <C-;> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)

" dart-vim-plugins
let g:dart_format_on_save = 1
let g:flutter_hot_reload_on_save = 1

