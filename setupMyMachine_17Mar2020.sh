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

#Install network monitoring tool
sudo apt install bmon

#Instruct kernel to write core file in the working directory
#The below pattern will create core file as core.<executable file name>.<pid of dumped process> 
echo "core.%e.%p" > /proc/sys/kernel/core_pattern 

#Install NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

#Install Ag (Ag is an order of magnitude faster than ack or grep)
#https://github.com/ggreer/the_silver_searcher
sudo apt-get install silversearcher-ag

#To enable bash shell completion install the below package
sudo apt-get install bash-completion

echo "Machine setup completed"
