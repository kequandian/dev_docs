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

### check ip route
```
docker run -ti --rm --net=host qnib/httpcheck ip -o -4 route
```
