### subscription-manager
```
This system is not registered to Red Hat Subscription Management. You can use subscription-manager to register.
```
> solution
```
$ cat /etc/yum/pluginconf.d/subscription-manager.conf
[main]
enabled=0
```

### no enabled repositories in "/etc/yum.repos.d"
```
Error: There are no enabled repositories in "/etc/yum.repos.d", "/etc/yum/repos.d", "/etc/distro.repos.d".
```
> solution
```
cd /etc/yum.repos.d
curl -O https://mirrors.aliyun.com/repo/Centos-8.repo
```
