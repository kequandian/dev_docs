# Ubuntu下安装Docker环境

## 0x0. 系统要求

>Docker引擎仅支持`x86_64`, `amd64`, `armhf`和`arm64`等体系架构

Ubuntu下安装Docker，需保证系统为64位的且为以下其中任意一个版本：

- **Ubuntu Hirsute 21.04**
- **Ubuntu Groovy 20.10**
- **Ubuntu Focal 20.04 (LTS)**
- **Ubuntu Bionic 18.04 (LTS)**
- **Ubuntu Xenial 16.04 (LTS)**

## 0x1. 快速卸载

- 卸载Docker引擎、CLI工具和容器等数据

```shell
$ sudo apt-get purge docker-ce docker-ce-cli containerd.io
```

- 清理**镜像、容器、存储卷和网络相关的数据**

```shell
$ sudo rm -rf /var/lib/docker
$ sudo rm -rf /var/lib/containerd
```

## 0x2. 存储驱动

位于Ubuntu下的Docker引擎支持`overlay2`, `aufs`和`btrfs`等存储驱动器，其中默认使用的是`overlay2`存储驱动，如需使用其他存储驱动，可参考[官方手册](https://docs.docker.com/storage/storagedriver/aufs-driver/)

## 0x3. 快速安装

首先更新`apt-get`，随后通过以下指令快速安装必须的工具包，如下所示

```shell
# 更新apt-get
$ sudo apt-get update
# 安装关键工具包，用于确保能够使用HTTPS等关键服务
$ sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
```

- **apt-transport-https:** 用于使`apt`包管理器能够通过HTTPS进行文件和数据的传输
- **ca-certificates:** 用于SSL协议安全认证的关键组件，确保HTTPS的安全性
- **curl:** 用于传输数据
- **software-properties-common:** 用于添加管理软件的脚本文件

随后通过以下指令添加Docker存储库信息，如下所示

```shell
# 获取Docker GPG密钥
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# 添加数据源
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

随后进行Docker组件的安装，如下所示

>默认安装**最新稳定版**

```shell
# 更新apt组件
$ sudo apt-get update
# Docker组件安装
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

如需安装指定的Docker版本，可通过以下命令进行安装，如下所示

```shell
# 打印所有版本信息
$ apt-cache madison docker-ce
  docker-ce | 5:18.09.1~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 5:18.09.0~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 18.06.1~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 18.06.0~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  ......
  
# 安装指定版本，其中<VERSION_STRING>替换为上述的18.06.0~ce~3-0~ubuntu等版本号
$ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
```

确保安装成功，可通过以下指令查看Docker版本号信息，如下所示

```shell
# 查看docker版本信息
$ sudo docker version
Client:
 Version:           18.09.7
 API version:       1.39
 Go version:        go1.10.4
 Git commit:        2d0083d
 Built:             Fri Dec 18 12:33:04 2020
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          18.09.7
  API version:      1.39 (minimum version 1.12)
  Go version:       go1.10.4
  Git commit:       2d0083d
  Built:            Fri Dec  4 23:02:49 2020
  OS/Arch:          linux/amd64
  Experimental:     false
```

可通过以下指令查看Docker服务状态，如下所示

```shell
$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
   Active: active (running) since Sat 2021-05-08 08:58:28 CST; 5h 45min ago
     Docs: https://docs.docker.com
 Main PID: 27529 (dockerd)
    Tasks: 24
   Memory: 454.8M
      CPU: 44.785s
   CGroup: /system.slice/docker.service
           ├─ 3122 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8003 -container-ip 172.20.0.2 -container-port 80
           └─27529 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
```

至此，Docker安装完成

## 0x4. 开机启动

通过以下指令即可设置开机启动

```shell
# 开机启动
$ sudo systemctl enable docker
# 查看docker状态
$ sudo systemctl status docker
# 启动docker服务
$ sudo systemctl start docker
```

## 0x5. 镜像源配置

中国大陆的常用镜像源列表如下所示

- **Docker 官方中国区**：https://registry.docker-cn.com
- **网易**：http://hub-mirror.c.163.com
- **中国科技大学**：https://docker.mirrors.ustc.edu.cn
- **阿里云**：https://y0qd3iq.mirror.aliyuncs.com

可通过以下方式修改镜像源信息，如下所示

```shell
# 编辑配置文件
$ sudo vim /etc/docker/daemon.json
```

输入以下配置内容，如下所示

> 源地址可参考上述列表

```javascript
{
  "registry-mirrors": ["https://xxxx.xx.x"]
}
```

修改完成后通过以下指令重启Docker服务

```shell
$ systemctl restart docker
```

可通过以下指令查看配置是否生效，如下所示

```shell
$ sudo docker info|grep Mirrors -A 1
```



