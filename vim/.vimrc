#The following line activates pathogen - vim plugin manager 
execute pathogen#infect()

#The syntax and filetype should always be after execute pathoned line
#Enables syntax recognition
syntax on

#Enables filetype recognition
filetype plugin indent on

set belloff=all
"syntax enable
set background=dark
set hlsearch
set incsearch
set tabstop=4

"If terminal(iterm2) is used set the color schme to solarized light/dark accordingly
"colorscheme solarized

"ctags: search first in current directory then file directory for tag file
set tags=tags;/

" The following line will show file name in the window tab
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

" Displays invisible characters as described below when set list is enabled
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Configuring F5 to act as a toggle switch for showing or not showing invisible characters easily in
" the middle of file editing
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>
