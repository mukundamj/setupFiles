# Machine setup instructions

## Virtual machine related settings
The following setting are required to be done manually if you want to ssh
from host machine to a VM. The settings are inspired by [StackExchange answer](https://unix.stackexchange.com/questions/145997/trying-to-ssh-to-local-vm-ubuntu-with-putty)
1. Since VirtualBox creates a private network (10.0.2.x) which will be connected
   to the host network using NAT(Unless configured otherwise) we cannot directly
   ssh to 10.0.2.x ip address.
2. In the network settings of VirtualBox configure the port-forwarding as below
   > Host IP: 127.0.1.1, Host Port: 2222, Guest IP: 10.0.2.x(IP of VM), Guest Port: 22
3. Now you can ssh from host machine to vm as 'ssh username@127.0.1.1 -p 2222".
4. Make sure that the host port is not 22 in the port forwarding setting, because
   ssh uses port 22 by default.

## Installing YouCompleteMe plugin using pathogen
The following setting are required to be done if you want to install YouCompleteMe.
1. Make sure that pathogen is already installed and appropriate .vim/ folders are setup
   i.e. ~/.vim/bundle and ~/.vim/autoload
   ```
   cd ~/.vim/bundle
   git clone https://github.com/Valloric/YouCompleteMe.git
   cd YouCompleteMe
   git submodule update --init --recursive
   ```
2. To install the plugin only for C family languages run
   ```
   ./install.sh --clang-completer
   ```
3. To install the plugin for Golang add --go-completer to the above command

## Mounting remote directory with sshfs.
This could be helpful if the development environment with all the customized
plugings is already setup and you want to edit the files on a remote server.
1. Use the below command to mount filesystem on a remote server 
   ```
   sshfs user@domain:/remote/directory/ /local/directory/
   ```
2. If the remote server is a virtual machine on the same host to which ssh
   tunnel is setup usiing port forwarding then use the below command
   ```
   sshfs user@127.0.1.1:/remote/directory/ -p 2222 /local/directory
   ```
   The local IP address 127.0.1.1 and the port 2222 depends on how the port
   forwarding is setup.
