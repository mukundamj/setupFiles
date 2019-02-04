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

## Network manager related settings
The following setting are required to be done manually if you want to
manage network interface manually
The settings are inspired by [blog](http://xmodulo.com/disable-network-manager-linux.html)
1. In the file /etc/NetworkManager/NetworkManager.conf set "managed=false" as shown below
   '''
   [ifupdown]
   managed=false
   '''
2. In the file /etc/network/interfaces add the configuration information for the interface.
   For example in the below settings the network interface enp0s31f6 has static ip address
   of 172.16.1.2.
   ''' 
   # network interface not managed by Network Manager
   allow-hotplug enp0s31f6
   iface enp0s31f6 inet static
   address 172.16.1.2
   netmask 255.255.0.0
   gateway 172.16.0.1
   dns-nameservers 8.8.8.8
   '''
3. Then Network Manager automatically ignore any interfaces specified in /etc/network/interfaces,
   and stop managing them. 
