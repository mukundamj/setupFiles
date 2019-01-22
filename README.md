# Machine setup instructions

## Virtual machine related settings
###### The following setting are required to be done manually if you want to ssh
###### from host machine to a VM. The settings are inspired by
###### [StackExchange answer](https://unix.stackexchange.com/questions/145997/trying-to-ssh-to-local-vm-ubuntu-with-putty)

1. VirtualBox will create a private network (10.0.2.x) which will be connected 
   to your host network using NAT. (Unless configured otherwise.)
2. In the network settings of VirtualBox configure the port-forwarding as below
   Host IP: 127.0.1.1, Host Port: 2222, Guest IP: 10.0.2.x (IP of VM),
   Guest Port: 22.
3. Now you can ssh from host machine to vm as 'ssh username@127.0.1.1 -p 2222".
4. Make sure that the host port is not 22 in the port forwarding setting, because
   ssh uses port 22 by default.
