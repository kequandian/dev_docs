### docker暴露了端口但外部仍然无法访问 解决方法参考



#### 问题描述

​	     在docker中正常配置了PORTS 但外部访问暴露的接口，仍然访问不到

#### 解决步骤

1.尝试重启iptables

```
service iptables restart
```

如果出现： 

```
	Failed to start iptables.service: Unit not found.
	则进行下面的步骤 尝试重新安装iptables   若上面语句运行正常，则可能下面的解决方案不适用
```

2.重新安装iptables
```
yum install iptables-services
```

3.设置启动时启用服务
```
systemctl enable iptables
```
4.启动iptables
```
systemctl start iptables
```
5.停止iptables
```
systemctl stop iptables
```
6.正常访问

参考网址

https://www.cnblogs.com/yudongdong/p/10984246.html  

https://stackoverflow.com/questions/24756240/how-can-i-use-iptables-on-centos-7 的第二个回答