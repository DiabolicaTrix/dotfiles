source ~/.vimrc

set background=dark
colorscheme palenight

set expandtab
set tabstop=2
set shiftwidth=2

if (has("termguicolors"))
  set termguicolors
endif

lua require('init')
