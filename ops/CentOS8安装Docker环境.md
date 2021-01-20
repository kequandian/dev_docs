#### 安装数据源 
> 用镜像数据源 `http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo`
> 代替官方数据源 `https://download.docker.com/linux/centos/docker-ce.repo`
```
# dnf config-manager --add-repo=http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```

#### 检查数据源
> `# cat /etc/yum.repos.d/docker-ce.repo`
```
# dnf list docker-ce
Last metadata expiration check: 0:00:23 ago on Wed 20 Jan 2021 06:13:22 AM PST.
Available Packages
docker-ce.x86_64                3:20.10.2-3.el8                 docker-ce-stable
```

#### 安装 docker ce
> 如果遇到padman问题, 增加 --allowerasing自动移除padman
```
# dnf install docker-ce --nobest -y --allowerasing 
```

#### 开机启动
```
# systemctl start docker
# systemctl enable --now docker 
```
