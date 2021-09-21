set fileencodings=utf-8,sjis,euc-jp
set fileformats=unix,dos,mac

set wildmenu
set belloff=all

"------------------------------
" 表示設定
"------------------------------

filetype plugin indent on
syntax on

set t_Co=256
"colorscheme iceberg
colorscheme desert

set number
function! NumberToggle()
  if(&rnu == 1)
    set nornu
    set nocursorline
    set nocursorcolumn
  else
    set rnu
    set cursorline
    set cursorcolumn
  endif
endfunc
nnoremap <C-l> :call NumberToggle()<cr>

"------------------------------
" 画面操作
"------------------------------

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
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

"------------------------------
" エディタ設定
"------------------------------

" バックアップ / Undo
set nobackup
set nowritebackup

if has('persistent_undo')
  let undo_path = "$HOME/.vim/undo"
  exe 'set undodir=' .. undo_path
	set undofile
endif

set updatetime=300

" バッファ
set hidden
autocmd BufWritePre * :%s/\s\+$//ge

" ヤンク / クリップボード
set clipboard+=unnamed

" インデント
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

let loaded_matchparen = 1

" 変換候補の最大表示数
set pumheight=10

set shortmess+=c

"set cmdheight=2

"------------------------------
" 検索設定
"------------------------------

set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"------------------------------
" Vundle - manage plugins
"------------------------------
set rtp+=~/dotfiles/.vim/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"---
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'cocopon/iceberg.vim' "theme
Plugin 'airblade/vim-gitgutter'
Plugin 'cohama/lexima.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'mattn/sonictemplate-vim'
"Plugin 'dart-lang/dart-vim-plugin'
"Plugin 'thosakwe/vim-flutter'

call vundle#end()

" scrooloose/nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeShowHidden=1
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" vim-airline/vim-airline-themes
" -- status bar
set laststatus=2
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%l/%L:%v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#branch#vcs_priority = ["git"]
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
" -- tab line
set showtabline=2
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> :bp<CR>
nmap <C-n> :bn<CR>
nmap <C-d> :bd<CR>
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
  \ '0': '0 ',
  \ '1': '1 ',
  \ '2': '2 ',
  \ '3': '3 ',
  \ '4': '4 ',
  \ '5': '5 ',
  \ '6': '6 ',
  \ '7': '7 ',
  \ '8': '8 ',
  \ '9': '9 '
  \}

" w0rp/ale
" -- Linting
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint'],
      \ 'go': ['gopls'],
      \ }
" -- Fixing
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ 'javascript': ['prettier','eslint'],
      \ }
" -- Completion
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
" -- Go To Definition
" :ALEGoToDefinition
" -- Find Refetences
" :FLEFindReferences
" -- Hovering
" -- Symbol Search
" :ALESymbolSearch
" -- Refactoring: Rename, Actions
" :ALERename
" :ALECodeAction
" -- 表示に関する設定
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" -- status bar
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = 'E:'
let g:airline#extensions#ale#warning_symbol = 'W:'
let g:airline#extensions#ale#show_line_numbers = 1
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'

" coc-nvim
let g:coc_disable_startup_warning = 1
imap <C-;> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<C-n>'
let g:coc_snippet_prev = '<C-p>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
" -- status bar
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'

" mattn/sonictemplate
let g:sonictemplate_vim_template_dir = ['~/.vim/template']

"" dart-vim-plugins
"let g:dart_format_on_save = 1
"let g:flutter_hot_reload_on_save = 1
