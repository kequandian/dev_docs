## 基于CentOS系统的容器安装
> [详细可参考docker官网](https://docs.docker.com/engine/install/centos/)

- `docker`
- `docker-compose`

####  先卸载旧版本的docker
```shell
$ sudo yum remove docker \
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
$ sudo yum install -y yum-utils
```

####  设置stable镜像仓库
```shell
$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```
> 由于国外仓库较慢，建议换成阿里云仓库 (选择这个选项则可忽略以上命令)
```shell
$ sudo yum-config-manager \
    --add-repo \
    https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```

####  安装Docker CE
```shell
$ sudo yum install docker-ce docker-ce-cli containerd.io
```

####  安装完成后启动docker
```shell
$ sudo systemctl start docker
```

#### 查看版本号说明安装成功
```shell
$ docker -v
Docker version 19.03.12, build 48a66213fe
```

#### 由于国内镜像下载速度较快，配置镜像加速用网易云或者阿里云都可以
> 网易云 
```shell
$ cat /etc/docker/daemon.json
{“registry-mirrors”: [“http://hub-mirror.c.163.com”] }
```

> 阿里云 (需要到阿里云镜像服务注册复制镜像服务地址并替换以下xxxxx，可参考以下详细说明)
- [docker配置阿里云镜像](https://blog.csdn.net/Baichi_00/article/details/102509012)
```shell
$ cat /etc/docker/daemon.json
{ “registry-mirrors”: [“https://xxxxx.mirror.aliyuncs.com”] } 
```

#### 重启 Docker
```shell
$ sudo systemctl daemon-reload
$ sudo systemctl restart docker
```

### 把当前用户增加到组 `docker`
```shell
$ sudo usermod -aG docker ubuntu  # 假设当前用登录户名为 ubuntu
```

#### 安装docker-compose
```shell
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

#### 设置权限
```shell
$ sudo chmod +x /usr/local/bin/docker-compose
```

####  查看版本号说明安装成功
```shell
$ sudo docker-compose -v
docker-compose version 1.25.0-rc4, build 8f3c9c58
```
