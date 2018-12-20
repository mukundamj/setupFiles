#!/bin/bash

echo "Machine setup started"

touch ~/.vimrc
cat vim/.vimrc | >> ~/.vimrc

touch ~/.bashrc
cat .bashrc | >> ~/.bashrc

touch ~/.bash_profile
cat .bash_profile | >> ~/.bash_profile

touch ~/.tmux.conf
cat tmux/.tmux.conf | >> ~/.tmux.conf

echo "Machine setup completed"
