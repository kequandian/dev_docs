
## Centos Minimal 网络配置
> 安装 Centos Minimal 默认没有开启网网配置
>

```shell
BOOTPROTO="dhcp"
$ cat /etc/sysconfig/network-scripts/ifcfg-enp0s3
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.3.230
GATEWAY=192.168.3.1
NETMASK=255.255.225.0
DNS1=8.8.8.8
```

#### 重启
```shell
$ service network restart
Restarting network (via systemctl):                        [  OK  ]
```
