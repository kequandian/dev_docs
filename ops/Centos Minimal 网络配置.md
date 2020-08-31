
## Centos Minimal 网络配置
> 安装 Centos Minimal 默认没有开启网网配置

```shell
$ cat /etc/sysconfig/network-scripts/ifcfg-enp0s3
ONBOOT="yes" 
BOOTPROTO="dhcp"
$ service network restart
Restarting network (via systemctl):                        [  OK  ]
```
