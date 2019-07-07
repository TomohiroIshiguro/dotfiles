set nocompatible

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

set ignorecase
set smartcase
set wrapscan
