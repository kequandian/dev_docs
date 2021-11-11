### 防火墙
```
systemctl stop firewalld  # disable firewall
firewall-cmd --state
firewall-cmd --help
firewall-cmd --zone=public --list-ports ## view all ports
firewall-cmd --zone=public --add-port=80/tcp --permanent   ## add port
firewall-cmd --zone= public --query-port=80/tcp  ## view port
firewall-cmd --zone= public --remove-port=80/tcp --permanent  ## remove port
```

## iptables
```
apt-get install iptables -y
iptables -L -n 
Chain DOCKER (18 references)
target     prot opt source               destination
ACCEPT     tcp  --  0.0.0.0/0            172.19.0.2           tcp dpt:80
ACCEPT     tcp  --  0.0.0.0/0            172.24.0.2           tcp dpt:5000
ACCEPT     tcp  --  0.0.0.0/0            172.25.0.2           tcp dpt:80
```

### check ip route
```
apt install iproute2  ## install ip
ip addr show lo
ip addr show docker0
docker run -ti --rm --net=host qnib/httpcheck ip -o -4 route
```

### traceroute
```
apt-get install traceroute
traceroute www.baidu.com
```
