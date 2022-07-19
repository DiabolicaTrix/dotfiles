source ~/.vimrc

set background=dark
colorscheme palenight

if (has("termguicolors"))
  set termguicolors
endif

lua require('init')
