syntax enable
set background=dark
"If terminal(iterm2) is used set the color schme to solarized light/dark accordingly
colorscheme solarized
set hlsearch
set incsearch
set tabstop=4

" ctags: search first in current directory then file directory for tag file
set tags=tags;/

" The following line will show file name in the window tab
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

