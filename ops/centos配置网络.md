### 动态IP配置
> ens33 通过 `ip addr` 获取
```shell
/etc/sysconfig/network-scripts
$ cat ifcfg-ens33
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=dhcp
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens33
UUID=771e15e9-c0b1-3a99-a086-cc3449fca100
DEVICE=ens33
ONBOOT=yes
AUTOCONNECT_PRIORITY=-999
DNS1=114.114.114.114
DNS2=8.8.8.8
```

### 静态IP配置
> 增加以下配置
> `BOOTPROTO`使用静态IP地址，默认为`dhcp`
```shell
BOOTPROTO="static"
IPADDR="192.168.3.66"
NETMASK="255.255.255.0"
GATEWAY="192.168.3.1"
```

> 重启网络
```shell
service network restart
```
