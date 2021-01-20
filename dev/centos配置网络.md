### 配置态态网络
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
