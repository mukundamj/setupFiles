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

echo "Machine setup completed"
