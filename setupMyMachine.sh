#!/bin/bash
if [ -z "$1" ] 
  then
    echo "IP address in the argument is missing"
    exit
fi
ssh root@$1 "mkdir -p ~/.vim/colors"
scp ~/sandbox/mjanardh/machineSetup/vimSetupFiles/solarized.vim root@$1:~/.vim/colors/solarized.vim
scp ~/sandbox/mjanardh/machineSetup/vimSetupFiles/.vimrc root@$1:~/.vimrc
scp ~/sandbox/mjanardh/machineSetup/runTestXtimes.sh root@$1:/ghostcache/runTestXtimes.sh
cat ~/sandbox/mjanardh/machineSetup/bashSetupFiles/myaliases | ssh root@$1 "cat >> ~/.bashrc" #To append my aliases to the ~/.bashrc file on the remote machine
ssh root@$1 "source ~/.bashrc"
echo "Machine setup completed"
