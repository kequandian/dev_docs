## `CentOS`操作系统的容器环境安装包括
- `docker`
- `docker-compose`

### 使用`daocloud.io`安装`docker`
> 适用于Ubuntu，Debian,Centos等大部分Linux，会3小时同步一次Docker官方资源
```
curl -sSL https://get.daocloud.io/docker | sh
```

### 使用`daocloud.io`安装`docker-compose`
```
curl -L https://get.daocloud.io/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

## `Docker`官方安装说明
>  详细可参考 [docker安装](https://docs.docker.com/engine/install/centos/) 官网说明


#### 脚本一步安装`Docker`
```
echo '151.101.64.133 raw.githubusercontent.com' >> /etc/hosts
curl -sL https://raw.githubusercontent.com/kequandian/dev_docs/master/ops/scripts/centos-script -o centos-script
sh centos-script --install-docker
```

## Step by Step

####  先卸载旧版本的docker
```shell
$ yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
```

####  安装需要的软件包
```shell
$ yum install -y yum-utils
```

####  设置stable镜像数据源
```shell
$ yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```
> 由于国外仓库较慢，建议换成阿里云仓库 (选择这个选项则可忽略以上命令)
```shell
$ yum-config-manager \
    --add-repo \
    https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```
或
```
# dnf config-manager --add-repo=http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```

- 检查数据源
> `# cat /etc/yum.repos.d/docker-ce.repo`
```
# dnf list docker-ce
Last metadata expiration check: 0:00:23 ago on Wed 20 Jan 2021 06:13:22 AM PST.
Available Packages
docker-ce.x86_64                3:20.10.2-3.el8                 docker-ce-stable
```

####  安装Docker CE
```shell
$ yum install docker-ce docker-ce-cli containerd.io
```
- 如果遇到padman问题, 增加 --allowerasing自动移除padman
```
# dnf install docker-ce --nobest -y --allowerasing 
```

#### 查看版本号说明安装成功 
```shell
$ docker -v
Docker version 19.03.12, build 48a66213fe
```

#### 把当前用户增加到组 `docker`
```shell
$ sudo usermod -aG docker ubuntu  # 假设当前用登录户名为 ubuntu
```

####  设置开机启动 docker
```shell
systemctl start docker
systemctl enable --now docker 
```

#### 试执行说明启动成功
```shell
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

#### 安装 docker-compose
[官方](https://github.com/docker/compose)
> OS版本为 CentOS8.x, 可通过访问`https://github.com/docker/compose/releases`用最新版本号替换以下版本号`1.27.4`
> 
> CentOS7.x 版本沿用 1.27.4 版本
```shell
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```

####  查看版本号说明`docker-compose`安装成功
```shell
$ sudo docker-compose -v
docker-compose version 1.27.4, build 8f3c9c58
```


## 如docker配置有更新，需要重启 Docker
```shell
$ sudo systemctl daemon-reload
$ sudo systemctl restart docker
```

## 错误解决方案
> 错误信息
```shell
$ docker ps
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
$ systemctl start docker
Job for docker.service failed because the control process exited with error code. See "systemctl status docker.service" and "journalctl -xe" for details.
```
> 解决方案
```shell
rm -f /var/lib/docker/
rm /etc/default/daemon.json
mkdir /var/lib/docker/
chmod go-r /var/lib/docker/
systemctl restart docker
```

## 增加私服命名空间(namespace)
```shell
$ cat /etc/docker/daemon.json
{
  "add-registry": ["192.168.100.100:5001"],
}
```

## 关于国内镜像加速器
> 网易云镜像加速器
```shell
$ cat /etc/docker/daemon.json
{“registry-mirrors”: [“http://hub-mirror.c.163.com”] }
```

> 阿里云镜像加速器
> 需要到阿里云镜像服务注册复制镜像服务地址并替换以下xxxxx，可参考以下详细说明
```shell
$ cat /etc/docker/daemon.json
{ “registry-mirrors”: [“https://xxxxx.mirror.aliyuncs.com”] } 
```

> [docker配置阿里云镜像](https://blog.csdn.net/Baichi_00/article/details/102509012)
