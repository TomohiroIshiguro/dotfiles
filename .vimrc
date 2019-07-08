set nocompatible

" 表示
" ----------------------------- 
filetype on
syntax on

function! NumberToggle()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc
nnoremap <C-l> :call NumberToggle()<cr>

" 検索設定
"------------------------------
set ignorecase
set smartcase
set wrapscan

" Vundle 
"------------------------------
set rtp+=~/dotfiles/.vim/Vundle.vim
call vundle#begin()

"Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
"------------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'thosakwe/vim-flutter'
Plugin 'suan/vim-instant-markdown'

call vundle#end()
filetype plugin indent on

" その他のカスタム設定を以下に書く
"------------------------------

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
\   'php': ['langserver','php -l'],
\   'html': ['HTMLHint','prettier'],
\   'css': ['csslint','prettier'],
\   'javascript': ['eslint','prettier'],
\   'java': ['checkstyle','google-java-format'],
\   'kotlin': ['kotlint','ktlint'],
\   'bash': ['shellcheck'],
\   'dockerfile': ['dockerfile_lint','hadolint'],
\   'json': ['jq','prettier'],
\   'yaml': ['swaglinit','prettier'],
\   'sql': ['sqlfmt','sqlint']
\}

