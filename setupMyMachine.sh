#!/bin/bash

echo "Machine setup started"

sudo apt-get install tmux

#Since xclip doesn't come with linux mint by default it has to be manually
#installed. It is required for copying stdout to clipboard
sudo apt install xclip

touch ~/.vimrc
cat vim/.vimrc >> ~/.vimrc

touch ~/.bashrc
cat .bashrc >> ~/.bashrc

touch ~/.bash_profile
cat .bash_profile >> ~/.bash_profile

touch ~/.tmux.conf
cat tmux/.tmux.conf >> ~/.tmux.conf

#Install guru: an editor-integrated tool for navigating Go code
go get golang.org/x/tools/cmd/guru
go build golang.org/x/tools/cmd/guru
mv guru $(go env GOROOT)/bin
guru -help

#Setup pathogen folders for vim plugin management
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#Install vim-go. The package is copied to bundle directory because
#we are using pathogen to manage packages
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

#Following vim-go packages installed as per the the link
#https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt

cd ~/.vim/bundle/

#Real-time completion (Vim):
git clone https://github.com/Shougo/neocomplete.vim

#Real-time completion (Neovim and Vim 8):
git clone https://github.com/Shougo/deoplete.nvim
git clone https://github.com/zchee/deoplete-go

#Display source code navigation in a sidebar:
git clone https://github.com/majutsushi/tagbar

#Snippets:
git clone https://github.com/joereynolds/vim-minisnip

#Interactive |:GoDecls| and |:GoDeclsDir|:
git clone https://github.com/Shougo/denite.nvim

cd

#Install network monitoring tool
sudo apt install bmon

#Instruct kernel to write core file in the working directory
#The below pattern will create core file as core.<executable file name>.<pid of dumped process> 
echo "core.%e.%p" > /proc/sys/kernel/core_pattern 

#Install code navigating tool
sudo apt-get install cscope

echo "Machine setup completed"
