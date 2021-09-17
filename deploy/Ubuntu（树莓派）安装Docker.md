## Ubuntu（树莓派）安装Docker

第一次执行sudo需要输入密码

先检查apt-get源更新，执行

```bash
sudo apt-get update
```

安装apt需要的依赖包（作用为允许apt通过HTTPS使用仓库），执行

```bash
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
```

执行到 您希望继续执行吗？ 输入Y 继续执行到结束

然后设置一下Docker官方的GPG Key，执行

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

然后设置Docker稳定板仓库，执行

```bash
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

然后再次更新apt源索引，执行

```bash
sudo apt-get update
```

然后安装Docker CE

```bash
sudo apt-get install docker-ce
```

检查docker是否安装成功（检查版本）

```bash
docker --version
```

出现 Docker version xx.xx.x , build xxxxxxx 则安装完成

如果安装不完成，请检查步骤

## 如何在Ubuntu中安装docker-compose

安装docker-compose 执行

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

给docker-compose 添加权限

```bash
sudo chmod +x /usr/local/bin/docker-compose
```

查看docker-compose 版本 

```bash
docker-compose --version
```

出现 docker-compose version 1.24.1, build 4667896b 代表安装完成

## 部分说明

一般情况下，docker-compose 是通过pip或pip3安装的 但是由于pip和pip3版本有时候会有问题，建议直接使用上面的操作安装

## Ubuntu 使用 docker 报错

报错信息

```
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json": dial unix /var/run/docker.sock: connect: permission denied
```

首先先添加docker组 

```bash
sudo groupadd docker
```

然后将登录用户加入到docker组中 

```bash
sudo gpasswd -a $USER docker 
```

最后更新一下用户组

```bash
newgrp docker
```

再次执行

```bash
docker ps
```
