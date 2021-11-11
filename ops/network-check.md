### origin ip
```
curl http://httpbin.org/ip
```

### firewall
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
>
> show route
```
ip route show
netstat -rn
ip route del default  #delete route
ip route add 10.0.4.0/24 via 10.0.2.1 dev eth1  ## add route
```

### netstat
```
$ netstat -rn
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
default         gateway         0.0.0.0         UG        0 0          0 enp0s3
172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0
172.18.0.0      0.0.0.0         255.255.0.0     U         0 0          0 br-6ffc24a181e5
172.19.0.0      0.0.0.0         255.255.0.0     U         0 0          0 br-d8df20365546
172.20.0.0      0.0.0.0         255.255.0.0     U         0 0          0 br-e11dce13f4e3

$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.3.1     0.0.0.0         UG    100    0        0 enp0s3
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
172.18.0.0      0.0.0.0         255.255.0.0     U     0      0        0 br-6ffc24a181e5
172.19.0.0      0.0.0.0         255.255.0.0     U     0      0        0 br-d8df20365546
```

### traceroute
```
apt-get install traceroute
traceroute www.baidu.com
```

### 测试`docker -p`端口转发
- [[Docker] 瞭解 Docker 的預設網路設置](https://mileslin.github.io/2019/05/%E7%9E%AD%E8%A7%A3-Docker-%E7%9A%84%E9%A0%90%E8%A8%AD%E7%B6%B2%E8%B7%AF%E8%A8%AD%E7%BD%AE/)
- [four-ways-to-connect-a-docker](https://blog.oddbit.com/post/2014-08-11-four-ways-to-connect-a-docker/)

```
docker run -d --name alpine -p 8088:80 alpine tail -f /dev/null
docker exec alpine ip addr show eth0
sudo iptables -t nat -L -n
```
