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

" Auto close CHADtree if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && &buftype == "nofile" && &filetype == "CHADTree") | q! | endif
